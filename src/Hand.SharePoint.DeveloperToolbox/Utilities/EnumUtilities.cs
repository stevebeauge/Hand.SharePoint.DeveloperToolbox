using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Hand.SharePoint.DeveloperToolbox.Utilities
{
    public static class EnumUtilities
    {
        public static bool TryParse<TEnum>(string value, out TEnum result, bool ignoreCase)
            where TEnum : struct, IConvertible 
        {
            var enumType = typeof(TEnum);

            if (!enumType.IsEnum) throw new ArgumentException("TEnum is not a enumeration");
            try
            {

                result = (TEnum)Enum.Parse(enumType, value, ignoreCase);

                return true;
            }
            catch
            {
                result = default(TEnum);
                return false;
            }
        }
        public static bool TryParse<TEnum>(string value, out TEnum result)
            where TEnum : struct, IConvertible
        {
            return TryParse<TEnum>(value, out result, false);
        }
    }
}
