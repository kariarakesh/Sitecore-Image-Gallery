using System.Text.RegularExpressions;
using Sitecore;
using Sitecore.Data;
using Sitecore.Data.Fields;
using Sitecore.Data.Items;
using Sitecore.Data.Managers;
using Sitecore.Data.Validators;
using Sitecore.Web;

namespace Keynotes.Code
{
    public static class ItemExtensions
    {
        private static bool IsItemValid(this Item item)
        {
            if (((item != null) && !item.Paths.IsMasterPart) && !StandardValuesManager.IsStandardValuesHolder(item))
            {
                item.Fields.ReadAll();
                item.Fields.Sort();
                foreach (Field field in item.Fields)
                {
                    if (!string.IsNullOrEmpty(field.Validation) && !Regex.IsMatch(field.Value, field.Validation, RegexOptions.Singleline))
                    {
                        return false;
                    }
                }


                var formValue = WebUtil.GetFormValue("scValidatorsKey");
                if (!string.IsNullOrEmpty(formValue))
                {
                    var validators = ValidatorManager.GetValidators(ValidatorsMode.ValidatorBar, formValue);
                    var options = new ValidatorOptions(true);
                    ValidatorManager.Validate(validators, options);
                    var valid = ValidatorResult.Valid;
                    foreach (BaseValidator validator in validators)
                    {
                        var result = validator.Result;
                        if (validator.ItemUri != null)
                        {
                            var item1 = Client.ContentDatabase.GetItem(validator.ItemUri.ToDataUri());
                            if (((item1 != null) && StandardValuesManager.IsStandardValuesHolder(item1)) && (result > ValidatorResult.CriticalError))
                            {
                                result = ValidatorResult.CriticalError;
                            }
                        }

                        if (result > valid)
                        {
                            valid = validator.Result;
                        }

                        if (validator.IsEvaluating && (validator.MaxValidatorResult >= ValidatorResult.CriticalError))
                        {
                            return false;
                        }
                    }

                    switch (valid)
                    {
                        case ValidatorResult.CriticalError:
                            return false;

                        case ValidatorResult.FatalError:

                            return false;
                    }
                }
            }

            return true;
        }
    }
}