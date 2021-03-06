--last edit 20150819
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__appSettings]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__appSettings](
	[keyName] [varchar](50) NOT NULL,
	[keyTitle] [varchar](500) NULL,
	[keyValue] [varchar](500) NULL,
	[keyInfo] [varchar](500) NULL,
 CONSTRAINT [PK_#__appSettings] PRIMARY KEY CLUSTERED 
(
	[keyName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__attributes]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__attributes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[itemType] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[attributeType] [int] NULL,
	[allowCustomValue] [bit] NULL,
	[measureUnit] [varchar](50) NULL,
 CONSTRAINT [PK_#__attributes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__attributesValues]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__attributesValues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[attributeId] [int] NOT NULL,
	[valueString] [varchar](max) NULL,
 CONSTRAINT [PK_#__attributesValues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__categories](
	[id] [int] NOT NULL,
	[sectionId] [int] NULL,
	[parentId] [int] NULL,
	[enabled] [bit] NULL,
	[ordering] [int] NULL,
	[defaultImageName] [varchar](50) NULL,
	[accessType] [int] NULL,
	[permissionId] [int] NULL,
	[accessCode] [varchar](255) NULL,
	[accessLevel] [int] NULL,
	[writeAccessType] [int] NULL,
	[writePermissionId] [int] NULL,
	[writeAccessCode] [varchar](255) NULL,
	[writeAccessLevel] [int] NULL,
	[cssClass] [varchar](50) NULL,
 CONSTRAINT [PK_#__categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__categories_Culture]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__categories_Culture](
	[cultureName] [varchar](10) NOT NULL,
	[categoryId] [int] NOT NULL,
	[title] [varchar](200) NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_#__categories_Culture] PRIMARY KEY CLUSTERED 
(
	[cultureName] ASC,
	[categoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__comments]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__comments](
	[id] [int] NOT NULL,
	[groupId] [int] NULL,
	[dateInserted] [datetime] NULL,
	[userInserted] [varchar](255) NULL,
	[userHostAddress] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[comment] [text] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_#__comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__cultures]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__cultures](
	[cultureCode] [varchar](10) NOT NULL,
	[displayName] [varchar](50) NULL,
	[enabled] [bit] NULL,
	[ordering] [int] NULL,
 CONSTRAINT [PK_#__cultures] PRIMARY KEY CLUSTERED 
(
	[cultureCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__customers]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__customers](
	[id] [int] NOT NULL,
	[companyName] [varchar](255) NULL,
	[vat] [varchar](255) NULL,
	[dateInserted] [datetime] NULL,
	[userInserted] [varchar](50) NULL,
	[dateUpdated] [datetime] NULL,
	[userUpdated] [varchar](50) NULL,
 CONSTRAINT [PK_#__customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__dbVersion]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__dbVersion](
	[componentFullName] [varchar](500) NOT NULL,
	[versionId] [int] NULL,
	[versionDate] [datetime] NULL,
 CONSTRAINT [PK_#__dbVersion] PRIMARY KEY CLUSTERED 
(
	[componentFullName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__events]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__events](
	[id] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[eventStart] [datetime] NULL,
	[eventEnd] [datetime] NULL,
	[resourceId] [int] NULL,
	[status] [int] NULL,
	[groupId] [int] NULL,
	[description] [varchar](500) NULL,
	[orderId] [int] NULL,
 CONSTRAINT [PK_#__events] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__formFieldOptions]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__formFieldOptions](
	[id] [int] NOT NULL,
	[formFieldId] [int] NOT NULL,
	[label] [varchar](255) NULL,
	[value] [varchar](255) NULL,
	[ordering] [int] NULL,
 CONSTRAINT [PK_#__formFieldOptions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__formFields]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__formFields](
	[id] [int] NOT NULL,
	[formId] [int] NULL,
	[enabled] [bit] NULL,
	[groupName] [varchar](255) NULL,
	[name] [varchar](255) NOT NULL,
	[defaultValue] [varchar](255) NULL,
	[minValue] [int] NULL,
	[maxValue] [int] NULL,
	[rowsNo] [int] NULL,
	[colsNo] [int] NULL,
	[cssClass] [varchar](255) NULL,
	[cssStyle] [varchar](255) NULL,
	[fieldType] [varchar](255) NULL,
 CONSTRAINT [PK_#__formFields] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__forms]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__forms](
	[id] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_#__forms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__geoCountries]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__geoCountries](
	[code] [varchar](2) NOT NULL,
	[iso3] [varchar](3) NULL,
	[continent] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[custom1] [varchar](255) NULL,
	[custom2] [varchar](255) NULL,
	[custom3] [varchar](255) NULL,
 CONSTRAINT [PK_#__geoCountries] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__geoZones]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__geoZones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[countryCode] [varchar](2) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[name] [varchar](255) NULL,
	[custom1] [varchar](255) NULL,
	[custom2] [varchar](255) NULL,
	[custom3] [varchar](255) NULL,
 CONSTRAINT [PK_#__geoZones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__itemFieldValues]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__itemFieldValues](
	[formFieldId] [int] NOT NULL,
	[itemId] [int] NOT NULL,
	[value] [varchar](5000) NULL,
 CONSTRAINT [PK_#__itemFieldValues] PRIMARY KEY CLUSTERED 
(
	[formFieldId] ASC,
	[itemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__items]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__items](
	[id] [int] NOT NULL,
	[itemType] [varchar](255) NULL,
	[categoryId] [int] NULL,
	[enabled] [bit] NULL,
	[ordering] [int] NULL,
	[defaultImageName] [varchar](50) NULL,
	[dateInserted] [datetime] NULL,
	[userInserted] [varchar](50) NULL,
	[dateUpdated] [datetime] NULL,
	[userUpdated] [varchar](50) NULL,
	[CustomBool1] [bit] NULL,
	[CustomBool2] [bit] NULL,
	[CustomBool3] [bit] NULL,
	[CustomDate1] [datetime] NULL,
	[CustomDate2] [datetime] NULL,
	[CustomDate3] [datetime] NULL,
	[CustomDecimal1] [decimal](18, 2) NULL,
	[CustomDecimal2] [decimal](18, 2) NULL,
	[CustomDecimal3] [decimal](18, 2) NULL,
	[CustomInt1] [int] NULL,
	[CustomInt2] [int] NULL,
	[CustomInt3] [int] NULL,
	[CustomString1] [varchar](max) NULL,
	[CustomString2] [varchar](max) NULL,
	[CustomString3] [varchar](max) NULL,
	[ItemParams] [varchar](max) NULL,
	[accessType] [int] NULL,
	[permissionId] [int] NULL,
	[accessCode] [varchar](255) NULL,
	[accessLevel] [int] NULL,
	[itemDate] [datetime] NULL,
	[validFrom] [datetime] NULL,
	[validTo] [datetime] NULL,
	[alias] [varchar](200) NULL,
	[commentsGroupId] [int] NULL,
	[writeAccessType] [int] NULL,
	[writePermissionId] [int] NULL,
	[writeAccessCode] [varchar](255) NULL,
	[writeAccessLevel] [int] NULL,
	[threadId] [int] NULL,
	[cssClass] [varchar](50) NULL,
 CONSTRAINT [PK_#__items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__items_Culture]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__items_Culture](
	[cultureName] [varchar](50) NOT NULL,
	[itemId] [int] NOT NULL,
	[title] [varchar](200) NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_#__items_Culture] PRIMARY KEY CLUSTERED 
(
	[cultureName] ASC,
	[itemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__itemsAttributesValues]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__itemsAttributesValues](
	[itemId] [int] NOT NULL,
	[attributeId] [int] NOT NULL,
	[attributeValueId] [int] NOT NULL,
	[customValueString] [varchar](max) NULL,
 CONSTRAINT [PK_#__itemsAttributesValues] PRIMARY KEY CLUSTERED 
(
	[itemId] ASC,
	[attributeId] ASC,
	[attributeValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__itemsRelated]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__itemsRelated](
	[itemId] [int] NOT NULL,
	[relatedId] [int] NOT NULL,
 CONSTRAINT [PK_#__itemsRelated] PRIMARY KEY CLUSTERED 
(
	[itemId] ASC,
	[relatedId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__labels]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__labels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cultureName] [varchar](50) NOT NULL,
	[resourceSet] [varchar](255) NOT NULL,
	[resourceId] [varchar](255) NOT NULL,
	[value] [varchar](max) NULL,
	[comment] [varchar](255) NULL,
	[textMode] [int] NULL,
	[isLocalized] [bit] NULL,
	[resourceParams] [varchar](max) NULL,
 CONSTRAINT [PK_#__labels] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[#__labels]') AND name = N'IX_#__labels')
CREATE UNIQUE NONCLUSTERED INDEX [IX_#__labels] ON [#__labels] 
(
	[cultureName] ASC,
	[resourceSet] ASC,
	[resourceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__logItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__logItems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dateInserted] [datetime] NULL,
	[userInserted] [varchar](50) NULL,
	[moduleId] [int] NULL,
	[type] [int] NULL,
	[userHostAddress] [varchar](50) NULL,
	[url] [varchar](500) NULL,
	[description] [varchar](500) NULL,
	[sessionId] [varchar](50) NULL,
 CONSTRAINT [PK_#__logItems] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__memberUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__memberUsers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NULL,
	[applicationName] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[comment] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[passwordQuestion] [varchar](255) NULL,
	[passwordAnswer] [varchar](255) NULL,
	[isApproved] [bit] NULL,
	[lastActivityDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
	[lastPasswordChangedDate] [datetime] NULL,
	[creationDate] [datetime] NULL,
	[isOnLine] [bit] NULL,
	[isLockedOut] [bit] NULL,
	[lastLockedOutDate] [datetime] NULL,
	[failedPasswordAttemptCount] [int] NULL,
	[failedPasswordAttemptWindowStart] [datetime] NULL,
	[failedPasswordAnswerAttemptCount] [int] NULL,
	[failedPasswordAnswerAttemptWindowStart] [datetime] NULL,
	[enabled] [bit] NULL,
	[accessCode] [varchar](255) NULL,
	[accessLevel] [int] NULL,
	[isCore] [bit] NULL,
	[sex] [varchar](1) NULL,
	[companyName] [varchar](255) NULL,
	[vat] [varchar](255) NULL,
	[ssn] [varchar](255) NULL,
	[firstName] [varchar](255) NULL,
	[secondName] [varchar](255) NULL,
	[address1] [varchar](255) NULL,
	[address2] [varchar](255) NULL,
	[city] [varchar](255) NULL,
	[state] [varchar](255) NULL,
	[zipCode] [varchar](255) NULL,
	[nation] [varchar](255) NULL,
	[tel1] [varchar](255) NULL,
	[mobile1] [varchar](255) NULL,
	[website1] [varchar](255) NULL,
	[allowMessages] [bit] NULL,
	[allowEmails] [bit] NULL,
	[validationCode] [varchar](255) NULL,
 CONSTRAINT [PK_#__memberUsers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[#__memberUsers]') AND name = N'IX_#__memberUsers')
CREATE UNIQUE NONCLUSTERED INDEX [IX_#__memberUsers] ON [#__memberUsers] 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__menu]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__menu](
	[id] [int] NOT NULL,
	[menuType] [varchar](50) NULL,
	[name] [varchar](200) NULL,
	[alias] [varchar](200) NULL,
	[link] [varchar](200) NULL,
	[contentType] [smallint] NULL,
	[published] [bit] NULL,
	[parentId] [int] NULL,
	[moduleId] [int] NULL,
	[ordering] [int] NULL,
	[accessType] [smallint] NULL,
	[overridePageTitle] [bit] NULL,
	[referMenuId] [int] NULL,
	[currMasterPage] [varchar](50) NULL,
	[currTheme] [varchar](50) NULL,
	[cssClass] [varchar](200) NULL,
	[visible] [bit] NULL,
	[routeId] [int] NULL,
	[permissionId] [int] NULL,
	[accessCode] [varchar](255) NULL,
	[accessLevel] [int] NULL,
	[isCore] [bit] NULL,
	[writeAccessType] [int] NULL,
	[writePermissionId] [int] NULL,
	[writeAccessCode] [varchar](255) NULL,
	[writeAccessLevel] [int] NULL,
	[useSsl] [int] NULL,
 CONSTRAINT [PK_#__menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__menu_Culture]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__menu_Culture](
	[cultureName] [varchar](50) NOT NULL,
	[menuId] [int] NOT NULL,
	[title] [varchar](200) NULL,
	[titleWindow] [varchar](200) NULL,
 CONSTRAINT [PK_#__menu_Culture] PRIMARY KEY CLUSTERED 
(
	[cultureName] ASC,
	[menuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__menuTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__menuTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menuType] [varchar](50) NULL,
	[title] [varchar](200) NULL,
	[description] [varchar](200) NULL,
 CONSTRAINT [PK_#__menuTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[#__menuTypes]') AND name = N'IX_#__menuTypes')
CREATE UNIQUE NONCLUSTERED INDEX [IX_#__menuTypes] ON [#__menuTypes] 
(
	[menuType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__messages]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__messages](
	[id] [int] NOT NULL,
	[ownerUser] [varchar](50) NULL,
	[fromUser] [varchar](50) NULL,
	[toUser] [varchar](500) NULL,
	[title] [varchar](200) NULL,
	[description] [varchar](max) NULL,
	[dateInserted] [datetime] NULL,
	[priority] [int] NULL,
	[isRead] [bit] NULL,
	[isStarred] [bit] NULL,
	[visible] [bit] NULL,
	[itemId] [int] NULL,
	[moduleId] [int] NULL,
 CONSTRAINT [PK_#__messages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__modules]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__modules](
	[id] [int] NOT NULL,
	[title] [varchar](200) NULL,
	[content] [varchar](max) NULL,
	[ordering] [int] NULL,
	[templateBlockName] [varchar](50) NULL,
	[published] [bit] NULL,
	[moduleName] [varchar](50) NULL,
	[moduleNamespace] [varchar](200) NULL,
	[dateInserted] [datetime] NULL,
	[userInserted] [varchar](50) NULL,
	[dateUpdated] [datetime] NULL,
	[userUpdated] [varchar](50) NULL,
	[accessType] [int] NULL,
	[showTitle] [bit] NULL,
	[moduleParams] [varchar](max) NULL,
	[isCore] [bit] NULL,
	[menuSelection] [int] NULL,
	[currView] [varchar](50) NULL,
	[permissionId] [int] NULL,
	[accessCode] [varchar](255) NULL,
	[accessLevel] [int] NULL,
	[cssFile] [varchar](50) NULL,
	[cssClass] [varchar](50) NULL,
	[useCache] [int] NULL,
	[useLog] [int] NULL,
	[directEditMode] [bit] NULL,
	[writeAccessType] [int] NULL,
	[writePermissionId] [int] NULL,
	[writeAccessCode] [varchar](255) NULL,
	[writeAccessLevel] [int] NULL,
	[systemMessagesTo] [varchar](255) NULL,
 CONSTRAINT [PK_#__modules] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__modules_Culture]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__modules_Culture](
	[cultureName] [varchar](50) NOT NULL,
	[moduleId] [int] NOT NULL,
	[title] [varchar](200) NULL,
 CONSTRAINT [PK_#__modules_Culture] PRIMARY KEY CLUSTERED 
(
	[cultureName] ASC,
	[moduleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__modulesMenu]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__modulesMenu](
	[moduleId] [int] NOT NULL,
	[menuId] [int] NOT NULL,
 CONSTRAINT [PK_#__modulesMenu] PRIMARY KEY CLUSTERED 
(
	[moduleId] ASC,
	[menuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__modulesMenuTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__modulesMenuTypes](
	[moduleId] [int] NOT NULL,
	[menuType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_#__modulesMenuTypes] PRIMARY KEY CLUSTERED 
(
	[moduleId] ASC,
	[menuType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__permissions]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__permissions](
	[id] [int] NOT NULL,
	[rolename] [varchar](255) NOT NULL,
 CONSTRAINT [PK_#__permissions] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[rolename] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__placeholders]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__placeholders](
	[name] [varchar](50) NOT NULL,
	[content] [text] NULL,
	[visible] [bit] NULL,
 CONSTRAINT [PK_#__placeholders] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__roles](
	[rolename] [varchar](255) NOT NULL,
	[applicationName] [varchar](255) NOT NULL,
 CONSTRAINT [PK_#__roles] PRIMARY KEY CLUSTERED 
(
	[rolename] ASC,
	[applicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__routeParams]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__routeParams](
	[routeId] [int] NOT NULL,
	[paramKey] [varchar](50) NOT NULL,
	[paramValue] [varchar](255) NULL,
	[paramConstraint] [varchar](255) NULL,
	[paramDataType] [varchar](255) NULL,
 CONSTRAINT [PK_#__routeParams_1] PRIMARY KEY CLUSTERED 
(
	[routeId] ASC,
	[paramKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__routes]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__routes](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[pattern] [varchar](255) NULL,
	[published] [bit] NULL,
	[ordering] [int] NULL,
	[currMasterPage] [varchar](50) NULL,
	[currTheme] [varchar](50) NULL,
	[isCore] [bit] NULL,
	[useSsl] [bit] NULL,
 CONSTRAINT [PK_#__routes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[#__routes]') AND name = N'IX_#__routes_name')
CREATE UNIQUE NONCLUSTERED INDEX [IX_#__routes_name] ON [#__routes] 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[#__routes]') AND name = N'IX_#__routes_pattern')
CREATE UNIQUE NONCLUSTERED INDEX [IX_#__routes_pattern] ON [#__routes] 
(
	[pattern] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__sections]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__sections](
	[id] [int] NOT NULL,
	[enabled] [bit] NULL,
	[accessType] [int] NULL,
	[permissionId] [int] NULL,
	[accessCode] [varchar](255) NULL,
	[accessLevel] [int] NULL,
	[writeAccessType] [int] NULL,
	[writePermissionId] [int] NULL,
	[writeAccessCode] [varchar](255) NULL,
	[writeAccessLevel] [int] NULL,
	[maxItems] [int] NULL,
	[maxAttachSizeKB] [int] NULL,
	[cssClass] [varchar](50) NULL,
 CONSTRAINT [PK_#__sections] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__sections_Culture]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__sections_Culture](
	[cultureName] [varchar](10) NOT NULL,
	[sectionId] [int] NOT NULL,
	[title] [varchar](200) NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_#__sections_Culture] PRIMARY KEY CLUSTERED 
(
	[cultureName] ASC,
	[sectionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__shop_coupons]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__shop_coupons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[dateInserted] [datetime] NOT NULL,
	[userInserted] [varchar](255) NOT NULL,
	[dateUpdated] [datetime] NOT NULL,
	[userUpdated] [varchar](255) NOT NULL,
	[validFrom] [datetime] NOT NULL,
	[validTo] [datetime] NOT NULL,
	[enabled] [bit] NOT NULL,
	[amount] [decimal](9, 2) NOT NULL,
	[isPercentage] [bit] NOT NULL,
	[minOrderAmount] [decimal](9, 2) NULL,
	[categoriesIdList] [varchar](max) NULL,
	[itemType] [varchar](255) NULL,
	[maxUses] [int] NULL,
	[usesCounter] [int] NULL,
 CONSTRAINT [PK_#__shop_coupons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[#__shop_coupons]') AND name = N'IX_#__shop_coupons')
CREATE UNIQUE NONCLUSTERED INDEX [IX_#__shop_coupons] ON [#__shop_coupons] 
(
	[code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__shop_customers]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__shop_customers](
	[id] [int] NOT NULL,
	[ownerUser] [varchar](255) NOT NULL,
	[dateInserted] [datetime] NULL,
	[userInserted] [varchar](50) NULL,
	[dateUpdated] [datetime] NULL,
	[userUpdated] [varchar](50) NULL,
	[companyName] [varchar](255) NULL,
	[firstName] [varchar](255) NULL,
	[secondName] [varchar](255) NULL,
	[ssn] [varchar](255) NULL,
	[vat] [varchar](255) NULL,
	[address] [varchar](255) NULL,
	[city] [varchar](255) NULL,
	[state] [varchar](255) NULL,
	[zipCode] [varchar](255) NULL,
	[nation] [varchar](255) NULL,
	[tel1] [varchar](255) NULL,
	[mobile1] [varchar](255) NULL,
	[website1] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[enabled] [bit] NULL,
	[notes] [varchar](5000) NULL,
	[jsData] [nvarchar](max) NULL,
	[custom1] [nvarchar](255) NULL,
	[custom2] [nvarchar](255) NULL,
	[custom3] [nvarchar](255) NULL,
 CONSTRAINT [PK_#__shop_customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[#__shop_customers]') AND name = N'IXssn_#__shop_customers')
CREATE NONCLUSTERED INDEX [IXssn_#__shop_customers] ON [#__shop_customers] 
(
	[ssn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[#__shop_customers]') AND name = N'IXvat_#__shop_customers')
CREATE NONCLUSTERED INDEX [IXvat_#__shop_customers] ON [#__shop_customers] 
(
	[vat] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__shop_orderHeader]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__shop_orderHeader](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderRef] [varchar](50) NULL,
	[ownerUser] [varchar](255) NULL,
	[customerId] [int] NULL,
	[orderDate] [datetime] NULL,
	[orderDateRequested] [datetime] NULL,
	[orderDateShipped] [datetime] NULL,
	[dateInserted] [datetime] NULL,
	[userInserted] [varchar](255) NULL,
	[dateUpdated] [datetime] NULL,
	[userUpdated] [varchar](255) NULL,
	[confirmed] [bit] NULL,
	[paid] [bit] NULL,
	[processed] [bit] NULL,
	[invoiced] [bit] NULL,
	[notes] [varchar](5000) NULL,
	[qtyAmount] [decimal](18, 2) NULL,
	[orderAmount] [decimal](18, 2) NULL,
	[shipAmount] [decimal](18, 2) NULL,
	[totalAmount] [decimal](18, 2) NULL,
	[totalPaid] [decimal](18, 2) NULL,
	[currency] [varchar](50) NULL,
	[invoiceId] [int] NULL,
	[invoiceRef] [varchar](200) NULL,
	[ordName] [varchar](500) NULL,
	[ordAddress] [varchar](500) NULL,
	[ordZipCode] [varchar](50) NULL,
	[ordCity] [varchar](50) NULL,
	[ordState] [varchar](50) NULL,
	[ordNation] [varchar](50) NULL,
	[ordPhone] [varchar](200) NULL,
	[ordEmail] [varchar](200) NULL,
	[couponCode] [varchar](50) NULL,
	[couponValue] [decimal](18, 2) NULL,
	[paymentCode] [varchar](20) NULL,
	[shipCode] [varchar](20) NULL,
	[couponIsPercentage] [bit] NULL,
	[jsData] [nvarchar](max) NULL,
	[custom1] [nvarchar](255) NULL,
	[custom2] [nvarchar](255) NULL,
	[custom3] [nvarchar](255) NULL,
 CONSTRAINT [PK_#__shop_orderHeader] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[#__shop_orderHeader]') AND name = N'IXOrderRef_#__shop_orderHeader')
CREATE UNIQUE NONCLUSTERED INDEX [IXOrderRef_#__shop_orderHeader] ON [#__shop_orderHeader] 
(
	[orderRef] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__shop_orderRows]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__shop_orderRows](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NULL,
	[productCode] [varchar](50) NULL,
	[qty] [decimal](18, 2) NULL,
	[priceNet] [decimal](18, 2) NULL,
	[taxPercentage] [decimal](18, 2) NULL,
	[rowNotes] [nvarchar](max) NULL,
 CONSTRAINT [PK_#__shop_orderRows] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__shop_payments]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__shop_payments](
	[payCode] [nvarchar](20) NOT NULL,
	[name] [nvarchar](50) NULL,
	[assemblyName] [nvarchar](100) NULL,
	[cssClass] [nvarchar](50) NULL,
	[isDebug] [bit] NULL,
	[enabled] [bit] NULL,
	[payAccount] [nvarchar](50) NULL,
	[paySubmitUrl] [nvarchar](100) NULL,
	[payCallbackUrl] [nvarchar](100) NULL,
	[siteOkUrl] [nvarchar](100) NULL,
	[siteKoUrl] [nvarchar](100) NULL,
	[minAmount] [decimal](18, 0) NULL,
	[maxAmount] [decimal](18, 0) NULL,
	[payParams] [nvarchar](500) NULL,
 CONSTRAINT [PK_#__shop_payments] PRIMARY KEY CLUSTERED 
(
	[payCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__staticPages]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__staticPages](
	[pageName] [varchar](50) NOT NULL,
	[visible] [bit] NULL,
	[showPageTitle] [bit] NULL,
 CONSTRAINT [PK_#__staticPages] PRIMARY KEY CLUSTERED 
(
	[pageName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__staticPages_Culture]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__staticPages_Culture](
	[cultureName] [varchar](10) NOT NULL,
	[pageName] [varchar](50) NOT NULL,
	[pageTitle] [varchar](50) NULL,
	[pageContent] [text] NULL,
 CONSTRAINT [PK_#__staticPages_Culture] PRIMARY KEY CLUSTERED 
(
	[cultureName] ASC,
	[pageName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__templateBlocks]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__templateBlocks](
	[name] [varchar](50) NOT NULL,
	[title] [varchar](500) NULL,
	[enabled] [bit] NULL,
	[orderId] [int] NULL,
 CONSTRAINT [PK_#__templateBlocks] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__usersInRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__usersInRoles](
	[username] [varchar](255) NOT NULL,
	[rolename] [varchar](255) NOT NULL,
	[applicationName] [varchar](255) NOT NULL,
 CONSTRAINT [PK_#__usersInRoles] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[rolename] ASC,
	[applicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__userTempData]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__userTempData](
	[id] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[sessionId] [varchar](255) NOT NULL,
	[dateInserted] [datetime] NOT NULL,
	[dateExpiration] [datetime] NOT NULL,
	[col01] [varchar](5000) NULL,
	[col02] [varchar](5000) NULL,
	[col03] [varchar](5000) NULL,
	[col04] [varchar](5000) NULL,
	[col05] [varchar](5000) NULL,
	[col06] [varchar](5000) NULL,
	[col07] [varchar](5000) NULL,
	[col08] [varchar](5000) NULL,
	[col09] [varchar](5000) NULL,
	[col10] [varchar](5000) NULL,
	[enabled] [bit] NULL,
 CONSTRAINT [PK_#__userTempData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__userTempData]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__userTempData](
	[id] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[sessionId] [varchar](255) NOT NULL,
	[dateInserted] [datetime] NOT NULL,
	[dateExpiration] [datetime] NOT NULL,
	[col01] [varchar](5000) NULL,
	[col02] [varchar](5000) NULL,
	[col03] [varchar](5000) NULL,
	[col04] [varchar](5000) NULL,
	[col05] [varchar](5000) NULL,
	[col06] [varchar](5000) NULL,
	[col07] [varchar](5000) NULL,
	[col08] [varchar](5000) NULL,
	[col09] [varchar](5000) NULL,
	[col10] [varchar](5000) NULL,
	[enabled] [bit] NULL,
 CONSTRAINT [PK_#__userTempData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__usersInRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__usersInRoles](
	[username] [varchar](255) NOT NULL,
	[rolename] [varchar](255) NOT NULL,
	[applicationName] [varchar](255) NOT NULL,
 CONSTRAINT [PK_#__usersInRoles] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[rolename] ASC,
	[applicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__templateBlocks]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__templateBlocks](
	[name] [varchar](50) NOT NULL,
	[title] [varchar](500) NULL,
	[enabled] [bit] NULL,
	[orderId] [int] NULL,
 CONSTRAINT [PK_#__templateBlocks] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__staticPages_Culture]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__staticPages_Culture](
	[cultureName] [varchar](10) NOT NULL,
	[pageName] [varchar](50) NOT NULL,
	[pageTitle] [varchar](50) NULL,
	[pageContent] [text] NULL,
 CONSTRAINT [PK_#__staticPages_Culture] PRIMARY KEY CLUSTERED 
(
	[cultureName] ASC,
	[pageName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__staticPages]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__staticPages](
	[pageName] [varchar](50) NOT NULL,
	[visible] [bit] NULL,
	[showPageTitle] [bit] NULL,
 CONSTRAINT [PK_#__staticPages] PRIMARY KEY CLUSTERED 
(
	[pageName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__shop_payments]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__shop_payments](
	[payCode] [nvarchar](20) NOT NULL,
	[name] [nvarchar](50) NULL,
	[assemblyName] [nvarchar](100) NULL,
	[cssClass] [nvarchar](50) NULL,
	[isDebug] [bit] NULL,
	[enabled] [bit] NULL,
	[payAccount] [nvarchar](50) NULL,
	[paySubmitUrl] [nvarchar](100) NULL,
	[payCallbackUrl] [nvarchar](100) NULL,
	[siteOkUrl] [nvarchar](100) NULL,
	[siteKoUrl] [nvarchar](100) NULL,
	[minAmount] [decimal](18, 0) NULL,
	[maxAmount] [decimal](18, 0) NULL,
	[payParams] [nvarchar](500) NULL,
 CONSTRAINT [PK_#__shop_payments] PRIMARY KEY CLUSTERED 
(
	[payCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__shop_orderRows]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__shop_orderRows](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NULL,
	[productCode] [varchar](50) NULL,
	[qty] [decimal](18, 2) NULL,
	[priceNet] [decimal](18, 2) NULL,
	[taxPercentage] [decimal](18, 2) NULL,
	[rowNotes] [nvarchar](max) NULL,
 CONSTRAINT [PK_#__shop_orderRows] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__shop_orderHeader]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__shop_orderHeader](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderRef] [varchar](50) NULL,
	[ownerUser] [varchar](255) NULL,
	[customerId] [int] NULL,
	[orderDate] [datetime] NULL,
	[orderDateRequested] [datetime] NULL,
	[orderDateShipped] [datetime] NULL,
	[dateInserted] [datetime] NULL,
	[userInserted] [varchar](255) NULL,
	[dateUpdated] [datetime] NULL,
	[userUpdated] [varchar](255) NULL,
	[confirmed] [bit] NULL,
	[paid] [bit] NULL,
	[processed] [bit] NULL,
	[invoiced] [bit] NULL,
	[notes] [varchar](5000) NULL,
	[qtyAmount] [decimal](18, 2) NULL,
	[orderAmount] [decimal](18, 2) NULL,
	[shipAmount] [decimal](18, 2) NULL,
	[totalAmount] [decimal](18, 2) NULL,
	[totalPaid] [decimal](18, 2) NULL,
	[currency] [varchar](50) NULL,
	[invoiceId] [int] NULL,
	[invoiceRef] [varchar](200) NULL,
	[ordName] [varchar](500) NULL,
	[ordAddress] [varchar](500) NULL,
	[ordZipCode] [varchar](50) NULL,
	[ordCity] [varchar](50) NULL,
	[ordState] [varchar](50) NULL,
	[ordNation] [varchar](50) NULL,
	[ordPhone] [varchar](200) NULL,
	[ordEmail] [varchar](200) NULL,
	[couponCode] [varchar](50) NULL,
	[couponValue] [decimal](18, 2) NULL,
	[paymentCode] [varchar](20) NULL,
	[shipCode] [varchar](20) NULL,
	[couponIsPercentage] [bit] NULL,
	[jsData] [nvarchar](max) NULL,
	[custom1] [nvarchar](255) NULL,
	[custom2] [nvarchar](255) NULL,
	[custom3] [nvarchar](255) NULL,
 CONSTRAINT [PK_#__shop_orderHeader] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[#__shop_orderHeader]') AND name = N'IXOrderRef_#__shop_orderHeader')
CREATE UNIQUE NONCLUSTERED INDEX [IXOrderRef_#__shop_orderHeader] ON [#__shop_orderHeader] 
(
	[orderRef] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__shop_customers]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__shop_customers](
	[id] [int] NOT NULL,
	[ownerUser] [varchar](255) NOT NULL,
	[dateInserted] [datetime] NULL,
	[userInserted] [varchar](50) NULL,
	[dateUpdated] [datetime] NULL,
	[userUpdated] [varchar](50) NULL,
	[companyName] [varchar](255) NULL,
	[firstName] [varchar](255) NULL,
	[secondName] [varchar](255) NULL,
	[ssn] [varchar](255) NULL,
	[vat] [varchar](255) NULL,
	[address] [varchar](255) NULL,
	[city] [varchar](255) NULL,
	[state] [varchar](255) NULL,
	[zipCode] [varchar](255) NULL,
	[nation] [varchar](255) NULL,
	[tel1] [varchar](255) NULL,
	[mobile1] [varchar](255) NULL,
	[website1] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[enabled] [bit] NULL,
	[notes] [varchar](5000) NULL,
	[jsData] [nvarchar](max) NULL,
	[custom1] [nvarchar](255) NULL,
	[custom2] [nvarchar](255) NULL,
	[custom3] [nvarchar](255) NULL,
 CONSTRAINT [PK_#__shop_customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[#__shop_customers]') AND name = N'IXssn_#__shop_customers')
CREATE NONCLUSTERED INDEX [IXssn_#__shop_customers] ON [#__shop_customers] 
(
	[ssn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[#__shop_customers]') AND name = N'IXvat_#__shop_customers')
CREATE NONCLUSTERED INDEX [IXvat_#__shop_customers] ON [#__shop_customers] 
(
	[vat] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__shop_coupons]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__shop_coupons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[dateInserted] [datetime] NOT NULL,
	[userInserted] [int] NOT NULL,
	[dateUpdated] [datetime] NOT NULL,
	[userUpdated] [int] NOT NULL,
	[validFrom] [datetime] NOT NULL,
	[validTo] [datetime] NOT NULL,
	[enabled] [bit] NOT NULL,
	[amount] [decimal](9, 2) NOT NULL,
	[isPercentage] [bit] NOT NULL,
	[minOrderAmount] [decimal](9, 2) NULL,
	[categoriesIdList] [varchar](max) NULL,
	[itemType] [varchar](255) NULL,
	[maxUses] [int] NULL,
	[usesCounter] [int] NULL,
 CONSTRAINT [PK_#__shop_coupons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[#__shop_coupons]') AND name = N'IX_#__shop_coupons')
CREATE UNIQUE NONCLUSTERED INDEX [IX_#__shop_coupons] ON [#__shop_coupons] 
(
	[code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__sections_Culture]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__sections_Culture](
	[cultureName] [varchar](10) NOT NULL,
	[sectionId] [int] NOT NULL,
	[title] [varchar](200) NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_#__sections_Culture] PRIMARY KEY CLUSTERED 
(
	[cultureName] ASC,
	[sectionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__sections]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__sections](
	[id] [int] NOT NULL,
	[enabled] [bit] NULL,
	[accessType] [int] NULL,
	[permissionId] [int] NULL,
	[accessCode] [varchar](255) NULL,
	[accessLevel] [int] NULL,
	[writeAccessType] [int] NULL,
	[writePermissionId] [int] NULL,
	[writeAccessCode] [varchar](255) NULL,
	[writeAccessLevel] [int] NULL,
	[maxItems] [int] NULL,
	[maxAttachSizeKB] [int] NULL,
	[cssClass] [varchar](50) NULL,
 CONSTRAINT [PK_#__sections] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__routes]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__routes](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[pattern] [varchar](255) NULL,
	[published] [bit] NULL,
	[ordering] [int] NULL,
	[currMasterPage] [varchar](50) NULL,
	[currTheme] [varchar](50) NULL,
	[isCore] [bit] NULL,
	[useSsl] [bit] NULL,
 CONSTRAINT [PK_#__routes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[#__routes]') AND name = N'IX_#__routes_name')
CREATE UNIQUE NONCLUSTERED INDEX [IX_#__routes_name] ON [#__routes] 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[#__routes]') AND name = N'IX_#__routes_pattern')
CREATE UNIQUE NONCLUSTERED INDEX [IX_#__routes_pattern] ON [#__routes] 
(
	[pattern] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__routeParams]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__routeParams](
	[routeId] [int] NOT NULL,
	[paramKey] [varchar](50) NOT NULL,
	[paramValue] [varchar](255) NULL,
	[paramConstraint] [varchar](255) NULL,
	[paramDataType] [varchar](255) NULL,
 CONSTRAINT [PK_#__routeParams_1] PRIMARY KEY CLUSTERED 
(
	[routeId] ASC,
	[paramKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__roles](
	[rolename] [varchar](255) NOT NULL,
	[applicationName] [varchar](255) NOT NULL,
 CONSTRAINT [PK_#__roles] PRIMARY KEY CLUSTERED 
(
	[rolename] ASC,
	[applicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__placeholders]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__placeholders](
	[name] [varchar](50) NOT NULL,
	[content] [text] NULL,
	[visible] [bit] NULL,
 CONSTRAINT [PK_#__placeholders] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__permissions]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__permissions](
	[id] [int] NOT NULL,
	[rolename] [varchar](255) NOT NULL,
 CONSTRAINT [PK_#__permissions] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[rolename] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__modulesMenuTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__modulesMenuTypes](
	[moduleId] [int] NOT NULL,
	[menuType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_#__modulesMenuTypes] PRIMARY KEY CLUSTERED 
(
	[moduleId] ASC,
	[menuType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__modulesMenu]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__modulesMenu](
	[moduleId] [int] NOT NULL,
	[menuId] [int] NOT NULL,
 CONSTRAINT [PK_#__modulesMenu] PRIMARY KEY CLUSTERED 
(
	[moduleId] ASC,
	[menuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__modules_Culture]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__modules_Culture](
	[cultureName] [varchar](50) NOT NULL,
	[moduleId] [int] NOT NULL,
	[title] [varchar](200) NULL,
 CONSTRAINT [PK_#__modules_Culture] PRIMARY KEY CLUSTERED 
(
	[cultureName] ASC,
	[moduleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__modules]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__modules](
	[id] [int] NOT NULL,
	[title] [varchar](200) NULL,
	[content] [varchar](max) NULL,
	[ordering] [int] NULL,
	[templateBlockName] [varchar](50) NULL,
	[published] [bit] NULL,
	[moduleName] [varchar](50) NULL,
	[moduleNamespace] [varchar](200) NULL,
	[dateInserted] [datetime] NULL,
	[userInserted] [varchar](50) NULL,
	[dateUpdated] [datetime] NULL,
	[userUpdated] [varchar](50) NULL,
	[accessType] [int] NULL,
	[showTitle] [bit] NULL,
	[moduleParams] [varchar](max) NULL,
	[isCore] [bit] NULL,
	[menuSelection] [int] NULL,
	[currView] [varchar](50) NULL,
	[permissionId] [int] NULL,
	[accessCode] [varchar](255) NULL,
	[accessLevel] [int] NULL,
	[cssFile] [varchar](50) NULL,
	[cssClass] [varchar](50) NULL,
	[useCache] [int] NULL,
	[useLog] [int] NULL,
	[directEditMode] [bit] NULL,
	[writeAccessType] [int] NULL,
	[writePermissionId] [int] NULL,
	[writeAccessCode] [varchar](255) NULL,
	[writeAccessLevel] [int] NULL,
	[systemMessagesTo] [varchar](255) NULL,
 CONSTRAINT [PK_#__modules] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__messages]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__messages](
	[id] [int] NOT NULL,
	[ownerUser] [varchar](50) NULL,
	[fromUser] [varchar](50) NULL,
	[toUser] [varchar](500) NULL,
	[title] [varchar](200) NULL,
	[description] [varchar](max) NULL,
	[dateInserted] [datetime] NULL,
	[priority] [int] NULL,
	[isRead] [bit] NULL,
	[isStarred] [bit] NULL,
	[visible] [bit] NULL,
	[itemId] [int] NULL,
	[moduleId] [int] NULL,
 CONSTRAINT [PK_#__messages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__menuTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__menuTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menuType] [varchar](50) NULL,
	[title] [varchar](200) NULL,
	[description] [varchar](200) NULL,
 CONSTRAINT [PK_#__menuTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[#__menuTypes]') AND name = N'IX_#__menuTypes')
CREATE UNIQUE NONCLUSTERED INDEX [IX_#__menuTypes] ON [#__menuTypes] 
(
	[menuType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__menu_Culture]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__menu_Culture](
	[cultureName] [varchar](50) NOT NULL,
	[menuId] [int] NOT NULL,
	[title] [varchar](200) NULL,
	[titleWindow] [varchar](200) NULL,
 CONSTRAINT [PK_#__menu_Culture] PRIMARY KEY CLUSTERED 
(
	[cultureName] ASC,
	[menuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__menu]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__menu](
	[id] [int] NOT NULL,
	[menuType] [varchar](50) NULL,
	[name] [varchar](200) NULL,
	[alias] [varchar](200) NULL,
	[link] [varchar](200) NULL,
	[contentType] [smallint] NULL,
	[published] [bit] NULL,
	[parentId] [int] NULL,
	[moduleId] [int] NULL,
	[ordering] [int] NULL,
	[accessType] [smallint] NULL,
	[overridePageTitle] [bit] NULL,
	[referMenuId] [int] NULL,
	[currMasterPage] [varchar](50) NULL,
	[currTheme] [varchar](50) NULL,
	[cssClass] [varchar](200) NULL,
	[visible] [bit] NULL,
	[routeId] [int] NULL,
	[permissionId] [int] NULL,
	[accessCode] [varchar](255) NULL,
	[accessLevel] [int] NULL,
	[isCore] [bit] NULL,
	[writeAccessType] [int] NULL,
	[writePermissionId] [int] NULL,
	[writeAccessCode] [varchar](255) NULL,
	[writeAccessLevel] [int] NULL,
	[useSsl] [int] NULL,
 CONSTRAINT [PK_#__menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__memberUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__memberUsers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NULL,
	[applicationName] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[comment] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[passwordQuestion] [varchar](255) NULL,
	[passwordAnswer] [varchar](255) NULL,
	[isApproved] [bit] NULL,
	[lastActivityDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
	[lastPasswordChangedDate] [datetime] NULL,
	[creationDate] [datetime] NULL,
	[isOnLine] [bit] NULL,
	[isLockedOut] [bit] NULL,
	[lastLockedOutDate] [datetime] NULL,
	[failedPasswordAttemptCount] [int] NULL,
	[failedPasswordAttemptWindowStart] [datetime] NULL,
	[failedPasswordAnswerAttemptCount] [int] NULL,
	[failedPasswordAnswerAttemptWindowStart] [datetime] NULL,
	[enabled] [bit] NULL,
	[accessCode] [varchar](255) NULL,
	[accessLevel] [int] NULL,
	[isCore] [bit] NULL,
	[sex] [varchar](1) NULL,
	[companyName] [varchar](255) NULL,
	[vat] [varchar](255) NULL,
	[ssn] [varchar](255) NULL,
	[firstName] [varchar](255) NULL,
	[secondName] [varchar](255) NULL,
	[address1] [varchar](255) NULL,
	[address2] [varchar](255) NULL,
	[city] [varchar](255) NULL,
	[state] [varchar](255) NULL,
	[zipCode] [varchar](255) NULL,
	[nation] [varchar](255) NULL,
	[tel1] [varchar](255) NULL,
	[mobile1] [varchar](255) NULL,
	[website1] [varchar](255) NULL,
	[allowMessages] [bit] NULL,
	[allowEmails] [bit] NULL,
	[validationCode] [varchar](255) NULL,
 CONSTRAINT [PK_#__memberUsers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[#__memberUsers]') AND name = N'IX_#__memberUsers')
CREATE UNIQUE NONCLUSTERED INDEX [IX_#__memberUsers] ON [#__memberUsers] 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__logItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__logItems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dateInserted] [datetime] NULL,
	[userInserted] [varchar](50) NULL,
	[moduleId] [int] NULL,
	[type] [int] NULL,
	[userHostAddress] [varchar](50) NULL,
	[url] [varchar](500) NULL,
	[description] [varchar](500) NULL,
	[sessionId] [varchar](50) NULL,
 CONSTRAINT [PK_#__logItems] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__labels]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__labels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cultureName] [varchar](50) NOT NULL,
	[resourceSet] [varchar](255) NOT NULL,
	[resourceId] [varchar](255) NOT NULL,
	[value] [varchar](max) NULL,
	[comment] [varchar](255) NULL,
	[textMode] [int] NULL,
	[isLocalized] [bit] NULL,
	[resourceParams] [varchar](max) NULL,
 CONSTRAINT [PK_#__labels] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[#__labels]') AND name = N'IX_#__labels')
CREATE UNIQUE NONCLUSTERED INDEX [IX_#__labels] ON [#__labels] 
(
	[cultureName] ASC,
	[resourceSet] ASC,
	[resourceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__itemsRelated]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__itemsRelated](
	[itemId] [int] NOT NULL,
	[relatedId] [int] NOT NULL,
 CONSTRAINT [PK_#__itemsRelated] PRIMARY KEY CLUSTERED 
(
	[itemId] ASC,
	[relatedId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__itemsAttributesValues]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__itemsAttributesValues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[itemId] [int] NOT NULL,
	[attributeId] [int] NOT NULL,
	[attributeValueId] [int] NULL,
	[customValueString] [varchar](max) NULL,
	[referred] [int] NOT NULL,
 CONSTRAINT [PK_#__itemsAttributesValues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__items_Culture]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__items_Culture](
	[cultureName] [varchar](50) NOT NULL,
	[itemId] [int] NOT NULL,
	[title] [varchar](200) NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_#__items_Culture] PRIMARY KEY CLUSTERED 
(
	[cultureName] ASC,
	[itemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__items]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__items](
	[id] [int] NOT NULL,
	[itemType] [varchar](255) NULL,
	[categoryId] [int] NULL,
	[enabled] [bit] NULL,
	[ordering] [int] NULL,
	[defaultImageName] [varchar](50) NULL,
	[dateInserted] [datetime] NULL,
	[userInserted] [varchar](50) NULL,
	[dateUpdated] [datetime] NULL,
	[userUpdated] [varchar](50) NULL,
	[CustomBool1] [bit] NULL,
	[CustomBool2] [bit] NULL,
	[CustomBool3] [bit] NULL,
	[CustomDate1] [datetime] NULL,
	[CustomDate2] [datetime] NULL,
	[CustomDate3] [datetime] NULL,
	[CustomDecimal1] [decimal](18, 2) NULL,
	[CustomDecimal2] [decimal](18, 2) NULL,
	[CustomDecimal3] [decimal](18, 2) NULL,
	[CustomInt1] [int] NULL,
	[CustomInt2] [int] NULL,
	[CustomInt3] [int] NULL,
	[CustomString1] [varchar](max) NULL,
	[CustomString2] [varchar](max) NULL,
	[CustomString3] [varchar](max) NULL,
	[ItemParams] [varchar](max) NULL,
	[accessType] [int] NULL,
	[permissionId] [int] NULL,
	[accessCode] [varchar](255) NULL,
	[accessLevel] [int] NULL,
	[itemDate] [datetime] NULL,
	[validFrom] [datetime] NULL,
	[validTo] [datetime] NULL,
	[alias] [varchar](200) NULL,
	[commentsGroupId] [int] NULL,
	[writeAccessType] [int] NULL,
	[writePermissionId] [int] NULL,
	[writeAccessCode] [varchar](255) NULL,
	[writeAccessLevel] [int] NULL,
	[threadId] [int] NULL,
	[cssClass] [varchar](50) NULL,
 CONSTRAINT [PK_#__items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__itemFieldValues]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__itemFieldValues](
	[formFieldId] [int] NOT NULL,
	[itemId] [int] NOT NULL,
	[value] [varchar](5000) NULL,
 CONSTRAINT [PK_#__itemFieldValues] PRIMARY KEY CLUSTERED 
(
	[formFieldId] ASC,
	[itemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__geoZones]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__geoZones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[countryCode] [varchar](2) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[name] [varchar](255) NULL,
	[custom1] [varchar](255) NULL,
	[custom2] [varchar](255) NULL,
	[custom3] [varchar](255) NULL,
 CONSTRAINT [PK_#__geoZones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__geoCountries]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__geoCountries](
	[code] [varchar](2) NOT NULL,
	[iso3] [varchar](3) NULL,
	[continent] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[custom1] [varchar](255) NULL,
	[custom2] [varchar](255) NULL,
	[custom3] [varchar](255) NULL,
 CONSTRAINT [PK_#__geoCountries] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__forms]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__forms](
	[id] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_#__forms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__formFields]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__formFields](
	[id] [int] NOT NULL,
	[formId] [int] NULL,
	[enabled] [bit] NULL,
	[groupName] [varchar](255) NULL,
	[name] [varchar](255) NOT NULL,
	[defaultValue] [varchar](255) NULL,
	[minValue] [int] NULL,
	[maxValue] [int] NULL,
	[rowsNo] [int] NULL,
	[colsNo] [int] NULL,
	[cssClass] [varchar](255) NULL,
	[cssStyle] [varchar](255) NULL,
	[fieldType] [varchar](255) NULL,
 CONSTRAINT [PK_#__formFields] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__formFieldOptions]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__formFieldOptions](
	[id] [int] NOT NULL,
	[formFieldId] [int] NOT NULL,
	[label] [varchar](255) NULL,
	[value] [varchar](255) NULL,
	[ordering] [int] NULL,
 CONSTRAINT [PK_#__formFieldOptions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__events]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__events](
	[id] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[eventStart] [datetime] NULL,
	[eventEnd] [datetime] NULL,
	[resourceId] [int] NULL,
	[status] [int] NULL,
	[groupId] [int] NULL,
	[description] [varchar](500) NULL,
	[orderId] [int] NULL,
 CONSTRAINT [PK_#__events] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__dbVersion]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__dbVersion](
	[componentFullName] [varchar](500) NOT NULL,
	[versionId] [int] NULL,
	[versionDate] [datetime] NULL,
 CONSTRAINT [PK_#__dbVersion] PRIMARY KEY CLUSTERED 
(
	[componentFullName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__customers]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__customers](
	[id] [int] NOT NULL,
	[companyName] [varchar](255) NULL,
	[vat] [varchar](255) NULL,
	[dateInserted] [datetime] NULL,
	[userInserted] [varchar](50) NULL,
	[dateUpdated] [datetime] NULL,
	[userUpdated] [varchar](50) NULL,
 CONSTRAINT [PK_#__customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__cultures]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__cultures](
	[cultureCode] [varchar](10) NOT NULL,
	[displayName] [varchar](50) NULL,
	[enabled] [bit] NULL,
	[ordering] [int] NULL,
 CONSTRAINT [PK_#__cultures] PRIMARY KEY CLUSTERED 
(
	[cultureCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__comments]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__comments](
	[id] [int] NOT NULL,
	[groupId] [int] NULL,
	[dateInserted] [datetime] NULL,
	[userInserted] [varchar](255) NULL,
	[userHostAddress] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[comment] [text] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_#__comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__categories_Culture]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__categories_Culture](
	[cultureName] [varchar](10) NOT NULL,
	[categoryId] [int] NOT NULL,
	[title] [varchar](200) NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_#__categories_Culture] PRIMARY KEY CLUSTERED 
(
	[cultureName] ASC,
	[categoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__categories](
	[id] [int] NOT NULL,
	[sectionId] [int] NULL,
	[parentId] [int] NULL,
	[enabled] [bit] NULL,
	[ordering] [int] NULL,
	[defaultImageName] [varchar](50) NULL,
	[accessType] [int] NULL,
	[permissionId] [int] NULL,
	[accessCode] [varchar](255) NULL,
	[accessLevel] [int] NULL,
	[writeAccessType] [int] NULL,
	[writePermissionId] [int] NULL,
	[writeAccessCode] [varchar](255) NULL,
	[writeAccessLevel] [int] NULL,
	[cssClass] [varchar](50) NULL,
 CONSTRAINT [PK_#__categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__attributesValues]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__attributesValues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[attributeId] [int] NOT NULL,
	[valueString] [varchar](max) NULL,
 CONSTRAINT [PK_#__attributesValues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__attributes]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__attributes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[itemType] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[attributeType] [int] NULL,
	[allowCustomValue] [bit] NULL,
	[measureUnit] [varchar](50) NULL,
 CONSTRAINT [PK_#__attributes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[#__appSettings]') AND type in (N'U'))
BEGIN
CREATE TABLE [#__appSettings](
	[keyName] [varchar](50) NOT NULL,
	[keyTitle] [varchar](500) NULL,
	[keyValue] [varchar](500) NULL,
	[keyInfo] [varchar](500) NULL,
 CONSTRAINT [PK_#__appSettings] PRIMARY KEY CLUSTERED 
(
	[keyName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
