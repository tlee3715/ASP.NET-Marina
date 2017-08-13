using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CPRG255.Framework.Data
{
    public class CheckNull
    {
        #region check integer null
        public static int? GetInteger(IDataReader reader, string columnName)
        {
            int Ordinal = reader.GetOrdinal(columnName);
            if (reader.IsDBNull(Ordinal))
            {
                return null;
            }
            else
            {
                return reader.GetInt32(Ordinal);
            }
        }
        #endregion

        #region check string null
        public static string GetString(IDataReader reader, string columnName)
        {
            int Ordinal = reader.GetOrdinal(columnName);
            if (reader.IsDBNull(Ordinal))
            {
                return null;
            }
            else
            {
                return reader.GetString(Ordinal);
            }
        }
        #endregion

        #region check double null
        public static double? GetDouble(IDataReader reader, string columnName)
        {
            int Ordinal = reader.GetOrdinal(columnName);
            if (reader.IsDBNull(Ordinal))
            {
                return null;
            }
            else
            {
                return reader.GetDouble(Ordinal);
            }
        }
        #endregion

        #region check DataTime null
        public static DateTime? GetDateTime(IDataReader reader, string columnName)
        {
            int Ordinal = reader.GetOrdinal(columnName);
            if (reader.IsDBNull(Ordinal))
            {
                return null;
            }
            else
            {
                return reader.GetDateTime(Ordinal);
            }
        }
        #endregion

        #region check float null
        public static float? GetFloat(IDataReader reader, string columnName)
        {
            int Ordinal = reader.GetOrdinal(columnName);
            if (reader.IsDBNull(Ordinal))
            {
                return null;
            }
            else
            {
                return reader.GetFloat(Ordinal);
            }
        }
        #endregion

        #region check decimal null
        public static decimal? GetDecimal(IDataReader reader, string columnName)
        {
            int Ordinal = reader.GetOrdinal(columnName);
            if (reader.IsDBNull(Ordinal))
            {
                return null;
            }
            else
            {
                return reader.GetDecimal(Ordinal);
            }
        }
        #endregion

        #region check boolean null
        public static bool? GetBoolean(IDataReader reader, string columnName)
        {
            int Ordinal = reader.GetOrdinal(columnName);
            if (reader.IsDBNull(Ordinal))
            {
                return null;
            }
            else
            {
                return reader.GetBoolean(Ordinal);
            }
        }
        #endregion
    }
}
