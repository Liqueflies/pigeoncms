﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.DirectoryServices;
using System.Linq;
using System.Text;
using System.Threading;

namespace PigeonCms
{
    public class AttributeValue : ITable
    {
        private int attributeId = 0;
        private string valueString = "";

        private Dictionary<string, string> valueTranslations = new Dictionary<string, string>();

        #region fields

        /// <summary>
        /// Automatic Id as PKey
        /// </summary>
        [DataObjectField(true)]
        public int Id { get; set; }

        /// <summary>
        /// AttributeId which value is related.
        /// </summary>
        [DataObjectField(false)]
        public int AttributeId
        {
            [DebuggerStepThrough()]
            get { return attributeId; }
            set { attributeId = value; }
        }

        /// <summary>
        /// Value in json format
        /// </summary>
        [DataObjectField(false)]
        public string ValueString
        {
            get { return valueString; }
            set { valueString = value; }
        }

        /// <summary>
        /// Value in current culture
        /// </summary>
        [DataObjectField(false)]
        public string Value
        {
            get
            {
                string res = "";
                ValueTranslations.TryGetValue(Thread.CurrentThread.CurrentCulture.Name, out res);
                if (Utility.IsEmptyFckField(res))
                    ValueTranslations.TryGetValue(Config.CultureDefault, out res);
                return res;
            }
        }

        /// <summary>
        /// Value in different culture
        /// </summary>
        [DataObjectField(false)]
        public Dictionary<string, string> ValueTranslations
        {
            [DebuggerStepThrough()]
            get { return valueTranslations; }
            [DebuggerStepThrough()]
            set { valueTranslations = value; }
        }

        public bool IsValueTranslated
        {
            get
            {
                bool res = true;
                string val = "";
                valueTranslations.TryGetValue(Thread.CurrentThread.CurrentCulture.Name, out val);
                if (Utility.IsEmptyFckField(val))
                    res = false;
                return res;
            }
        }

        #endregion

        #region methods

        public AttributeValue() { }

        #endregion

    }

    /// <summary>
    /// Filter used in search
    /// </summary>
    /// <remarks></remarks>
    [Serializable]
    public class AttributeValueFilter
    {
        #region fields definition

        private int id = 0;
        private int attributeId = 0;
        private int numOfRecords = 0;

        public int Id
        {
            [DebuggerStepThrough()]
            get { return id; }
            [DebuggerStepThrough()]
            set { id = value; }
        }

        public int AttributeId
        {
            [DebuggerStepThrough()]
            get { return attributeId; }
            [DebuggerStepThrough()]
            set { attributeId = value; }
        }

        public int NumOfRecords
        {
            [DebuggerStepThrough()]
            get { return numOfRecords; }
            [DebuggerStepThrough()]
            set { numOfRecords = value; }
        }

        #endregion

    }
}
