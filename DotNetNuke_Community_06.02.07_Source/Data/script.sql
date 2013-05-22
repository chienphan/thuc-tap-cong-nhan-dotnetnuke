SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Version]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Version](
	[VersionId] [int] IDENTITY(1,1) NOT NULL,
	[Major] [int] NOT NULL,
	[Minor] [int] NOT NULL,
	[Build] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Version] PRIMARY KEY CLUSTERED 
(
	[VersionId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Version] UNIQUE NONCLUSTERED 
(
	[Major] ASC,
	[Minor] ASC,
	[Build] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventQueue]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EventQueue](
	[EventMessageID] [int] IDENTITY(1,1) NOT NULL,
	[EventName] [nvarchar](100) NOT NULL,
	[Priority] [int] NOT NULL,
	[ProcessorType] [nvarchar](250) NOT NULL,
	[ProcessorCommand] [nvarchar](250) NOT NULL,
	[Body] [nvarchar](250) NOT NULL,
	[Sender] [nvarchar](250) NOT NULL,
	[Subscriber] [nvarchar](100) NOT NULL,
	[AuthorizedRoles] [nvarchar](250) NOT NULL,
	[ExceptionMessage] [nvarchar](250) NOT NULL,
	[SentDate] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NOT NULL,
	[Attributes] [ntext] NOT NULL,
	[IsComplete] [bit] NOT NULL CONSTRAINT [DF_EventQueue_IsComplete]  DEFAULT ((0)),
 CONSTRAINT [PK_EventQueue] PRIMARY KEY CLUSTERED 
(
	[EventMessageID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Applications]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Schedule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Schedule](
	[ScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[TypeFullName] [varchar](200) NOT NULL,
	[TimeLapse] [int] NOT NULL,
	[TimeLapseMeasurement] [varchar](2) NOT NULL,
	[RetryTimeLapse] [int] NOT NULL,
	[RetryTimeLapseMeasurement] [varchar](2) NOT NULL,
	[RetainHistoryNum] [int] NOT NULL,
	[AttachToEvent] [varchar](50) NOT NULL,
	[CatchUpEnabled] [bit] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[ObjectDependencies] [varchar](300) NOT NULL,
	[Servers] [nvarchar](2000) NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
	[FriendlyName] [nvarchar](200) NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Permission](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[PermissionCode] [varchar](50) NOT NULL,
	[ModuleDefID] [int] NOT NULL,
	[PermissionKey] [varchar](50) NOT NULL,
	[PermissionName] [varchar](50) NOT NULL,
	[ViewOrder] [int] NOT NULL CONSTRAINT [DF_Permission_ViewOrder]  DEFAULT ((9999)),
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Permission] UNIQUE NONCLUSTERED 
(
	[PermissionCode] ASC,
	[ModuleDefID] ASC,
	[PermissionKey] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebServers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WebServers](
	[ServerID] [int] IDENTITY(1,1) NOT NULL,
	[ServerName] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
	[URL] [nvarchar](255) NULL,
	[IISAppName] [nvarchar](200) NOT NULL CONSTRAINT [DF_WebServers_IISAppName]  DEFAULT (''),
	[Enabled] [bit] NOT NULL CONSTRAINT [DF_WebServers_Enabled]  DEFAULT ((1)),
 CONSTRAINT [PK_WebServers] PRIMARY KEY CLUSTERED 
(
	[ServerID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Messaging_Messages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Messaging_Messages](
	[MessageID] [bigint] IDENTITY(1,1) NOT NULL,
	[PortalID] [int] NOT NULL,
	[FromUserID] [int] NOT NULL,
	[ToUserName] [nvarchar](50) NULL,
	[FromUserName] [nvarchar](50) NULL,
	[ToUserID] [int] NULL,
	[ToRoleID] [int] NULL,
	[Status] [tinyint] NOT NULL,
	[Subject] [nvarchar](max) NULL,
	[Body] [nvarchar](max) NULL,
	[Date] [datetime] NOT NULL,
	[Conversation] [uniqueidentifier] NOT NULL,
	[ReplyTo] [bigint] NULL,
	[AllowReply] [bit] NOT NULL,
	[SkipPortal] [bit] NOT NULL,
	[EmailSent] [bit] NOT NULL,
	[EmailSentDate] [datetime] NULL,
	[EmailSchedulerInstance] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Messaging_Messages] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_SchemaVersions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Languages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Languages](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[CultureCode] [nvarchar](50) NOT NULL,
	[CultureName] [nvarchar](200) NOT NULL,
	[FallbackCulture] [nvarchar](50) NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Workflow]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Workflow](
	[WorkflowID] [int] IDENTITY(1,1) NOT NULL,
	[PortalID] [int] NULL,
	[WorkflowName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Workflow] PRIMARY KEY CLUSTERED 
(
	[WorkflowID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RelationshipTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RelationshipTypes](
	[RelationshipTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Direction] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedByUserID] [int] NOT NULL,
	[CreatedOnDate] [datetime] NOT NULL CONSTRAINT [DF_RelationshipTypes_CreatedOnDate]  DEFAULT (getdate()),
	[LastModifiedByUserID] [int] NOT NULL,
	[LastModifiedOnDate] [datetime] NOT NULL CONSTRAINT [DF_RelationshipTypes_LastModifiedOnDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_RelationshipTypes] PRIMARY KEY CLUSTERED 
(
	[RelationshipTypeID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MetaData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MetaData](
	[MetaDataID] [int] IDENTITY(1,1) NOT NULL,
	[MetaDataName] [nvarchar](100) NOT NULL,
	[MetaDataDescription] [nvarchar](2500) NULL,
 CONSTRAINT [PK_MetaData] PRIMARY KEY CLUSTERED 
(
	[MetaDataID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SearchWord]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SearchWord](
	[SearchWordsID] [int] IDENTITY(1,1) NOT NULL,
	[Word] [nvarchar](100) NOT NULL,
	[IsCommon] [bit] NULL,
	[HitCount] [int] NOT NULL,
 CONSTRAINT [PK_SearchWord] PRIMARY KEY CLUSTERED 
(
	[SearchWordsID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_SearchWord] UNIQUE NONCLUSTERED 
(
	[Word] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SearchCommonWords]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SearchCommonWords](
	[CommonWordID] [int] IDENTITY(1,1) NOT NULL,
	[CommonWord] [nvarchar](255) NOT NULL,
	[Locale] [nvarchar](10) NULL,
 CONSTRAINT [PK_SearchCommonWords] PRIMARY KEY CLUSTERED 
(
	[CommonWordID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Taxonomy_VocabularyTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Taxonomy_VocabularyTypes](
	[VocabularyTypeID] [int] IDENTITY(1,1) NOT NULL,
	[VocabularyType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Taxonomy_VocabularyType] PRIMARY KEY CLUSTERED 
(
	[VocabularyTypeID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Taxonomy_ScopeTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Taxonomy_ScopeTypes](
	[ScopeTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ScopeType] [nvarchar](250) NULL,
 CONSTRAINT [PK_ScopeTypes] PRIMARY KEY CLUSTERED 
(
	[ScopeTypeID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HostSettings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HostSettings](
	[SettingName] [nvarchar](50) NOT NULL,
	[SettingValue] [nvarchar](256) NOT NULL,
	[SettingIsSecure] [bit] NOT NULL CONSTRAINT [DF_HostSettings_Secure]  DEFAULT ((0)),
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_HostSettings] PRIMARY KEY CLUSTERED 
(
	[SettingName] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gobom_info]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[gobom_info](
	[id] [nchar](10) NULL,
	[ten] [text] NULL,
	[ho] [text] NULL,
	[sdt] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PackageTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PackageTypes](
	[PackageType] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[SecurityAccessLevel] [int] NOT NULL,
	[EditorControlSrc] [nvarchar](250) NULL,
 CONSTRAINT [PK_PackageTypes_1] PRIMARY KEY CLUSTERED 
(
	[PackageType] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventLogTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EventLogTypes](
	[LogTypeKey] [nvarchar](35) NOT NULL,
	[LogTypeFriendlyName] [nvarchar](50) NOT NULL,
	[LogTypeDescription] [nvarchar](128) NOT NULL,
	[LogTypeOwner] [nvarchar](100) NOT NULL,
	[LogTypeCSSClass] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_EventLogTypes] PRIMARY KEY CLUSTERED 
(
	[LogTypeKey] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gobom.Tag]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[gobom.Tag](
	[ID] [int] NOT NULL,
	[TagName] [ntext] NOT NULL,
 CONSTRAINT [PK_gobom.Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lists]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Lists](
	[EntryID] [int] IDENTITY(1,1) NOT NULL,
	[ListName] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](100) NOT NULL,
	[Text] [nvarchar](150) NOT NULL,
	[ParentID] [int] NOT NULL CONSTRAINT [DF_Lists_ParentID]  DEFAULT ((0)),
	[Level] [int] NOT NULL CONSTRAINT [DF_Lists_Level]  DEFAULT ((0)),
	[SortOrder] [int] NOT NULL CONSTRAINT [DF_Lists_SortOrder]  DEFAULT ((0)),
	[DefinitionID] [int] NOT NULL CONSTRAINT [DF_Lists_DefinitionID]  DEFAULT ((0)),
	[Description] [nvarchar](500) NULL,
	[PortalID] [int] NOT NULL CONSTRAINT [DF_Lists_PortalID]  DEFAULT ((-1)),
	[SystemList] [bit] NOT NULL CONSTRAINT [DF_Lists_SystemList]  DEFAULT ((0)),
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_Lists] PRIMARY KEY CLUSTERED 
(
	[EntryID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Lists_ListName_Value_Text_ParentID] UNIQUE NONCLUSTERED 
(
	[ListName] ASC,
	[Value] ASC,
	[Text] ASC,
	[ParentID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Classification]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Classification](
	[ClassificationId] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationName] [nvarchar](200) NOT NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_VendorCategory] PRIMARY KEY CLUSTERED 
(
	[ClassificationId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleSettings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RoleSettings](
	[RoleSettingID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[SettingName] [nvarchar](50) NOT NULL,
	[SettingValue] [nvarchar](2000) NOT NULL,
	[CreatedByUserID] [int] NOT NULL,
	[CreatedOnDate] [datetime] NOT NULL CONSTRAINT [DF_RoleSettings_CreatedOnDate]  DEFAULT (getdate()),
	[LastModifiedByUserID] [int] NOT NULL,
	[LastModifiedOnDate] [datetime] NOT NULL CONSTRAINT [DF_RoleSettings_LastModifiedOnDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_RoleSettings] PRIMARY KEY CLUSTERED 
(
	[RoleSettingID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[IsSuperUser] [bit] NOT NULL CONSTRAINT [DF_Users_IsSuperUser]  DEFAULT ((0)),
	[AffiliateId] [int] NULL,
	[Email] [nvarchar](256) NULL,
	[DisplayName] [nvarchar](128) NOT NULL CONSTRAINT [DF_Users_DisplayName]  DEFAULT (''),
	[UpdatePassword] [bit] NOT NULL CONSTRAINT [DF_Users_UpdatePassword]  DEFAULT ((0)),
	[LastIPAddress] [nvarchar](50) NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Users_IsDeleted]  DEFAULT ((0)),
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Users] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SearchIndexer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SearchIndexer](
	[SearchIndexerID] [int] IDENTITY(1,1) NOT NULL,
	[SearchIndexerAssemblyQualifiedName] [char](200) NOT NULL,
 CONSTRAINT [PK_SearchIndexer] PRIMARY KEY CLUSTERED 
(
	[SearchIndexerID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gobom.News]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[gobom.News](
	[ID] [int] NOT NULL,
	[IDTag] [int] NOT NULL,
	[Title] [ntext] NOT NULL,
	[Contents] [ntext] NOT NULL,
	[ImageURL] [text] NULL,
	[DateCreate] [bigint] NOT NULL,
	[DateModified] [bigint] NULL,
	[Poster] [ntext] NOT NULL,
 CONSTRAINT [PK_gobom.News] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContentTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ContentTypes](
	[ContentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ContentType] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ContentTypes] PRIMARY KEY CLUSTERED 
(
	[ContentTypeID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PortalGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PortalGroups](
	[PortalGroupID] [int] IDENTITY(1,1) NOT NULL,
	[MasterPortalID] [int] NULL,
	[PortalGroupName] [nvarchar](100) NULL,
	[PortalGroupDescription] [nvarchar](2000) NULL,
	[AuthenticationDomain] [nvarchar](200) NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_PortalGroup] PRIMARY KEY CLUSTERED 
(
	[PortalGroupID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Portals]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Portals](
	[PortalID] [int] IDENTITY(0,1) NOT NULL,
	[ExpiryDate] [datetime] NULL,
	[UserRegistration] [int] NOT NULL CONSTRAINT [DF_Portals_UserRegistration]  DEFAULT ((0)),
	[BannerAdvertising] [int] NOT NULL CONSTRAINT [DF_Portals_BannerAdvertising]  DEFAULT ((0)),
	[AdministratorId] [int] NULL,
	[Currency] [char](3) NULL,
	[HostFee] [money] NOT NULL CONSTRAINT [DF_Portals_HostFee]  DEFAULT ((0)),
	[HostSpace] [int] NOT NULL CONSTRAINT [DF_Portals_HostSpace]  DEFAULT ((0)),
	[AdministratorRoleId] [int] NULL,
	[RegisteredRoleId] [int] NULL,
	[GUID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Portals_GUID]  DEFAULT (newid()),
	[PaymentProcessor] [nvarchar](50) NULL,
	[ProcessorUserId] [nvarchar](50) NULL,
	[ProcessorPassword] [nvarchar](50) NULL,
	[SiteLogHistory] [int] NULL,
	[DefaultLanguage] [nvarchar](10) NOT NULL CONSTRAINT [DF_Portals_DefaultLanguage]  DEFAULT ('en-US'),
	[TimezoneOffset] [int] NOT NULL CONSTRAINT [DF_Portals_TimezoneOffset]  DEFAULT ((-8)),
	[HomeDirectory] [varchar](100) NOT NULL CONSTRAINT [DF_Portals_HomeDirectory]  DEFAULT (''),
	[PageQuota] [int] NOT NULL CONSTRAINT [DF_Portals_PageQuota]  DEFAULT ((0)),
	[UserQuota] [int] NOT NULL CONSTRAINT [DF_Portals_UserQuota]  DEFAULT ((0)),
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
	[PortalGroupID] [int] NULL,
 CONSTRAINT [PK_Portals] PRIMARY KEY CLUSTERED 
(
	[PortalID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Journal_Security]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Journal_Security](
	[JournalSecurityId] [int] IDENTITY(1,1) NOT NULL,
	[JournalId] [int] NOT NULL,
	[SecurityKey] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Journal_Security] PRIMARY KEY CLUSTERED 
(
	[JournalSecurityId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Journal_Security] UNIQUE NONCLUSTERED 
(
	[JournalId] DESC,
	[SecurityKey] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Journal_Access]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Journal_Access](
	[JournalAccessId] [int] IDENTITY(1,1) NOT NULL,
	[JournalTypeId] [int] NOT NULL,
	[PortalId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[AccessKey] [uniqueidentifier] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Journal_Access] PRIMARY KEY CLUSTERED 
(
	[JournalAccessId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Journal_TypeFilters]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Journal_TypeFilters](
	[JournalTypeFilterId] [int] IDENTITY(1,1) NOT NULL,
	[PortalId] [int] NOT NULL,
	[ModuleId] [int] NOT NULL,
	[JournalTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Journal_TypeFilters] PRIMARY KEY CLUSTERED 
(
	[JournalTypeFilterId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Journal_Types]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Journal_Types](
	[JournalTypeId] [int] NOT NULL,
	[JournalType] [nvarchar](25) NULL,
	[icon] [nvarchar](25) NULL,
	[PortalId] [int] NOT NULL CONSTRAINT [DF_JournalTypes_PortalId]  DEFAULT ((-1)),
	[IsEnabled] [bit] NOT NULL CONSTRAINT [DF_JournalTypes_IsEnabled]  DEFAULT ((1)),
	[AppliesToProfile] [bit] NOT NULL CONSTRAINT [DF_JournalTypes_AppliesToProfile]  DEFAULT ((1)),
	[AppliesToGroup] [bit] NOT NULL CONSTRAINT [DF_JournalTypes_AppliesToGroup]  DEFAULT ((1)),
	[AppliesToStream] [bit] NOT NULL CONSTRAINT [DF_JournalTypes_AppliesToStream]  DEFAULT ((1)),
	[Options] [nvarchar](max) NULL,
	[SupportsNotify] [bit] NOT NULL CONSTRAINT [DF_JournalTypes_SupportsNotify]  DEFAULT ((0)),
	[EnableComments] [bit] NOT NULL CONSTRAINT [DF_Journal_Types_EnableComments]  DEFAULT ((1)),
 CONSTRAINT [PK_JournalTypes] PRIMARY KEY CLUSTERED 
(
	[JournalTypeId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL DEFAULT ((0)),
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL DEFAULT (NULL),
	[IsAnonymous] [bit] NOT NULL DEFAULT ((0)),
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScheduleHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ScheduleHistory](
	[ScheduleHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Succeeded] [bit] NULL,
	[LogNotes] [ntext] NULL,
	[NextStart] [datetime] NULL,
	[Server] [nvarchar](150) NULL,
 CONSTRAINT [PK_ScheduleHistory] PRIMARY KEY CLUSTERED 
(
	[ScheduleHistoryID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScheduleItemSettings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ScheduleItemSettings](
	[ScheduleID] [int] NOT NULL,
	[SettingName] [nvarchar](50) NOT NULL,
	[SettingValue] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ScheduleItemSettings] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC,
	[SettingName] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DesktopModulePermission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DesktopModulePermission](
	[DesktopModulePermissionID] [int] IDENTITY(1,1) NOT NULL,
	[PortalDesktopModuleID] [int] NOT NULL,
	[PermissionID] [int] NOT NULL,
	[AllowAccess] [bit] NOT NULL,
	[RoleID] [int] NULL,
	[UserID] [int] NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_DesktopModulePermission] PRIMARY KEY CLUSTERED 
(
	[DesktopModulePermissionID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_DesktopModulePermission] UNIQUE NONCLUSTERED 
(
	[PortalDesktopModuleID] ASC,
	[PermissionID] ASC,
	[RoleID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ModulePermission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ModulePermission](
	[ModulePermissionID] [int] IDENTITY(1,1) NOT NULL,
	[ModuleID] [int] NOT NULL,
	[PermissionID] [int] NOT NULL,
	[AllowAccess] [bit] NOT NULL,
	[RoleID] [int] NULL,
	[UserID] [int] NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_ModulePermission] PRIMARY KEY CLUSTERED 
(
	[ModulePermissionID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_ModulePermission] UNIQUE NONCLUSTERED 
(
	[ModuleID] ASC,
	[PermissionID] ASC,
	[RoleID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TabPermission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TabPermission](
	[TabPermissionID] [int] IDENTITY(1,1) NOT NULL,
	[TabID] [int] NOT NULL,
	[PermissionID] [int] NOT NULL,
	[AllowAccess] [bit] NOT NULL,
	[RoleID] [int] NULL,
	[UserID] [int] NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_TabPermission] PRIMARY KEY CLUSTERED 
(
	[TabPermissionID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_TabPermission] UNIQUE NONCLUSTERED 
(
	[TabID] ASC,
	[PermissionID] ASC,
	[RoleID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FolderPermission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FolderPermission](
	[FolderPermissionID] [int] IDENTITY(1,1) NOT NULL,
	[FolderID] [int] NOT NULL,
	[PermissionID] [int] NOT NULL,
	[AllowAccess] [bit] NOT NULL,
	[RoleID] [int] NULL,
	[UserID] [int] NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_FolderPermission] PRIMARY KEY CLUSTERED 
(
	[FolderPermissionID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_FolderPermission] UNIQUE NONCLUSTERED 
(
	[FolderID] ASC,
	[PermissionID] ASC,
	[RoleID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Files]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Files](
	[FileId] [int] IDENTITY(1,1) NOT NULL,
	[PortalId] [int] NULL,
	[FileName] [nvarchar](246) NOT NULL,
	[Extension] [nvarchar](100) NOT NULL,
	[Size] [int] NOT NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[ContentType] [nvarchar](200) NOT NULL,
	[Folder] [nvarchar](246) NULL,
	[FolderID] [int] NOT NULL,
	[Content] [image] NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
	[UniqueId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Files_UniqueId]  DEFAULT (newid()),
	[VersionGuid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Files_VersionGuid]  DEFAULT (newid()),
	[SHA1Hash] [varchar](40) NULL,
	[LastModificationTime] [datetime] NOT NULL DEFAULT (getdate()),
 CONSTRAINT [PK_File] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_FileName] UNIQUE NONCLUSTERED 
(
	[FolderID] ASC,
	[FileName] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Files_UniqueId] UNIQUE NONCLUSTERED 
(
	[UniqueId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LanguagePacks]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LanguagePacks](
	[LanguagePackID] [int] IDENTITY(1,1) NOT NULL,
	[PackageID] [int] NOT NULL,
	[DependentPackageID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_LanguagePacks] PRIMARY KEY CLUSTERED 
(
	[LanguagePackID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PortalLanguages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PortalLanguages](
	[PortalLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[PortalID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
	[IsPublished] [bit] NOT NULL CONSTRAINT [DF_PortalLanguages_IsPublished]  DEFAULT ((0)),
 CONSTRAINT [PK_PortalLanguages] PRIMARY KEY CLUSTERED 
(
	[PortalLanguageID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkflowStates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkflowStates](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[WorkflowID] [int] NOT NULL,
	[StateName] [nvarchar](50) NOT NULL,
	[Order] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Notify] [bit] NOT NULL,
 CONSTRAINT [PK_WorkflowStates] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Relationships]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Relationships](
	[RelationshipID] [int] IDENTITY(1,1) NOT NULL,
	[RelationshipTypeID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[PortalID] [int] NULL,
	[UserID] [int] NULL,
	[DefaultResponse] [int] NOT NULL,
	[CreatedByUserID] [int] NOT NULL,
	[CreatedOnDate] [datetime] NOT NULL CONSTRAINT [DF_Relationships_CreatedOnDate]  DEFAULT (getdate()),
	[LastModifiedByUserID] [int] NOT NULL,
	[LastModifiedOnDate] [datetime] NOT NULL CONSTRAINT [DF_Relationships_LastModifiedOnDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Relationships] PRIMARY KEY CLUSTERED 
(
	[RelationshipID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HtmlTextLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HtmlTextLog](
	[HtmlTextLogID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[StateID] [int] NOT NULL,
	[Comment] [nvarchar](4000) NULL,
	[Approved] [bit] NOT NULL,
	[CreatedByUserID] [int] NOT NULL,
	[CreatedOnDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HtmlTextLog] PRIMARY KEY CLUSTERED 
(
	[HtmlTextLogID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HtmlText]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HtmlText](
	[ModuleID] [int] NOT NULL,
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Version] [int] NULL,
	[StateID] [int] NULL,
	[IsPublished] [bit] NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
	[Summary] [ntext] NULL,
 CONSTRAINT [PK_HtmlText] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SearchItemWord]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SearchItemWord](
	[SearchItemWordID] [int] IDENTITY(1,1) NOT NULL,
	[SearchItemID] [int] NOT NULL,
	[SearchWordsID] [int] NOT NULL,
	[Occurrences] [int] NOT NULL,
 CONSTRAINT [PK_SearchItemWords] PRIMARY KEY CLUSTERED 
(
	[SearchItemWordID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_SearchItemWord] UNIQUE NONCLUSTERED 
(
	[SearchItemID] ASC,
	[SearchWordsID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserProfile]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserProfile](
	[ProfileID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PropertyDefinitionID] [int] NOT NULL,
	[PropertyValue] [nvarchar](3750) NULL,
	[PropertyText] [nvarchar](max) NULL,
	[Visibility] [int] NOT NULL CONSTRAINT [DF__UserP__Visib__1352D76D]  DEFAULT ((0)),
	[LastUpdatedDate] [datetime] NOT NULL,
	[ExtendedVisibility] [varchar](400) NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[ProfileID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContentItems_MetaData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ContentItems_MetaData](
	[ContentItemMetaDataID] [int] IDENTITY(1,1) NOT NULL,
	[ContentItemID] [int] NOT NULL,
	[MetaDataID] [int] NOT NULL,
	[MetaDataValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_Content_MetaData] PRIMARY KEY CLUSTERED 
(
	[ContentItemMetaDataID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRelationships]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserRelationships](
	[UserRelationshipID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RelatedUserID] [int] NOT NULL,
	[RelationshipID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedByUserID] [int] NOT NULL,
	[CreatedOnDate] [datetime] NOT NULL CONSTRAINT [DF_UserRelationships_CreatedOnDate]  DEFAULT (getdate()),
	[LastModifiedByUserID] [int] NOT NULL,
	[LastModifiedOnDate] [datetime] NOT NULL CONSTRAINT [DF_UserRelationships_LastModifiedOnDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_UserRelationships] PRIMARY KEY CLUSTERED 
(
	[UserRelationshipID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRelationshipPreferences]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserRelationshipPreferences](
	[PreferenceID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RelationshipID] [int] NOT NULL,
	[DefaultResponse] [int] NOT NULL,
	[CreatedByUserID] [int] NOT NULL,
	[CreatedOnDate] [datetime] NOT NULL CONSTRAINT [DF_UserRelationshipPreferences_CreatedOnDate]  DEFAULT (getdate()),
	[LastModifiedByUserID] [int] NOT NULL,
	[LastModifiedOnDate] [datetime] NOT NULL CONSTRAINT [DF_UserRelationshipPreferences_LastModifiedOnDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_UserRelationshipPreferences] PRIMARY KEY CLUSTERED 
(
	[PreferenceID] ASC,
	[RelationshipID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContentItems_Tags]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ContentItems_Tags](
	[ContentItemTagID] [int] IDENTITY(1,1) NOT NULL,
	[ContentItemID] [int] NOT NULL,
	[TermID] [int] NOT NULL,
 CONSTRAINT [PK_ContentItems_Tags] PRIMARY KEY CLUSTERED 
(
	[ContentItemTagID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Taxonomy_Vocabularies]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Taxonomy_Vocabularies](
	[VocabularyID] [int] IDENTITY(1,1) NOT NULL,
	[VocabularyTypeID] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](2500) NULL,
	[Weight] [int] NOT NULL CONSTRAINT [DF_Taxonomy_Vocabularies_Weight]  DEFAULT ((0)),
	[ScopeID] [int] NULL,
	[ScopeTypeID] [int] NOT NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
	[IsSystem] [bit] NOT NULL CONSTRAINT [DF_Taxonomy_Vocabularies_IsSystem]  DEFAULT ((0)),
 CONSTRAINT [PK_Taxonomy_Vocabulary] PRIMARY KEY CLUSTERED 
(
	[VocabularyID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SearchItemWordPosition]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SearchItemWordPosition](
	[SearchItemWordPositionID] [int] IDENTITY(1,1) NOT NULL,
	[SearchItemWordID] [int] NOT NULL,
	[ContentPosition] [int] NOT NULL,
 CONSTRAINT [PK_SearchItemWordPosition] PRIMARY KEY CLUSTERED 
(
	[SearchItemWordPositionID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TabModuleSettings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TabModuleSettings](
	[TabModuleID] [int] NOT NULL,
	[SettingName] [nvarchar](50) NOT NULL,
	[SettingValue] [nvarchar](max) NOT NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_TabModuleSettings] PRIMARY KEY CLUSTERED 
(
	[TabModuleID] ASC,
	[SettingName] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Assemblies]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Assemblies](
	[AssemblyID] [int] IDENTITY(1,1) NOT NULL,
	[PackageID] [int] NOT NULL,
	[AssemblyName] [nvarchar](250) NOT NULL,
	[Version] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_PackageAssemblies] PRIMARY KEY CLUSTERED 
(
	[AssemblyID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SkinControls]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SkinControls](
	[SkinControlID] [int] IDENTITY(1,1) NOT NULL,
	[PackageID] [int] NOT NULL CONSTRAINT [DF_SkinControls_PackageID]  DEFAULT ((-1)),
	[ControlKey] [nvarchar](50) NULL,
	[ControlSrc] [nvarchar](256) NULL,
	[IconFile] [nvarchar](100) NULL,
	[HelpUrl] [nvarchar](200) NULL,
	[SupportsPartialRendering] [bit] NOT NULL CONSTRAINT [DF_SkinControls_SupportsPartialRendering]  DEFAULT ((0)),
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_SkinControls] PRIMARY KEY CLUSTERED 
(
	[SkinControlID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Authentication]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Authentication](
	[AuthenticationID] [int] IDENTITY(1,1) NOT NULL,
	[PackageID] [int] NOT NULL CONSTRAINT [DF__Authe__Packa__43F60EC8]  DEFAULT ((-1)),
	[AuthenticationType] [nvarchar](100) NOT NULL,
	[IsEnabled] [bit] NOT NULL CONSTRAINT [DF_Authentication_IsEnabled]  DEFAULT ((0)),
	[SettingsControlSrc] [nvarchar](250) NOT NULL,
	[LoginControlSrc] [nvarchar](250) NOT NULL,
	[LogoffControlSrc] [nvarchar](250) NOT NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_Authentication] PRIMARY KEY CLUSTERED 
(
	[AuthenticationID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dashboard_Controls]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Dashboard_Controls](
	[DashboardControlID] [int] IDENTITY(1,1) NOT NULL,
	[DashboardControlKey] [nvarchar](50) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[DashboardControlSrc] [nvarchar](250) NOT NULL,
	[DashboardControlLocalResources] [nvarchar](250) NOT NULL,
	[ControllerClass] [nvarchar](250) NULL,
	[ViewOrder] [int] NOT NULL CONSTRAINT [DF_Dashboard_Controls_ViewOrder]  DEFAULT ((0)),
	[PackageID] [int] NOT NULL CONSTRAINT [DF_Dashboard_Controls_PackageID]  DEFAULT ((-1)),
 CONSTRAINT [PK_Dashboard] PRIMARY KEY CLUSTERED 
(
	[DashboardControlID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SkinPackages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SkinPackages](
	[SkinPackageID] [int] IDENTITY(1,1) NOT NULL,
	[PackageID] [int] NOT NULL,
	[PortalID] [int] NULL,
	[SkinName] [nvarchar](50) NOT NULL,
	[SkinType] [nvarchar](20) NOT NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_SkinPackages] PRIMARY KEY CLUSTERED 
(
	[SkinPackageID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DesktopModules]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DesktopModules](
	[DesktopModuleID] [int] IDENTITY(1,1) NOT NULL,
	[FriendlyName] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Version] [nvarchar](8) NULL,
	[IsPremium] [bit] NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[BusinessControllerClass] [nvarchar](200) NULL,
	[FolderName] [nvarchar](128) NOT NULL,
	[ModuleName] [nvarchar](128) NOT NULL,
	[SupportedFeatures] [int] NOT NULL CONSTRAINT [DF_DesktopModules_SupportedFeatures]  DEFAULT ((0)),
	[CompatibleVersions] [nvarchar](500) NULL,
	[Dependencies] [nvarchar](400) NULL,
	[Permissions] [nvarchar](400) NULL,
	[PackageID] [int] NOT NULL CONSTRAINT [DF_DesktopModules_PackageID]  DEFAULT ((-1)),
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
	[ContentItemId] [int] NOT NULL CONSTRAINT [DF_DesktopModules_ContentItemId]  DEFAULT ((-1)),
 CONSTRAINT [PK_DesktopModules] PRIMARY KEY CLUSTERED 
(
	[DesktopModuleID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_DesktopModules_ModuleName] UNIQUE NONCLUSTERED 
(
	[ModuleName] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(0,1) NOT NULL,
	[PortalID] [int] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[ServiceFee] [money] NULL CONSTRAINT [DF_Roles_ServiceFee]  DEFAULT ((0)),
	[BillingFrequency] [char](1) NULL,
	[TrialPeriod] [int] NULL,
	[TrialFrequency] [char](1) NULL,
	[BillingPeriod] [int] NULL,
	[TrialFee] [money] NULL,
	[IsPublic] [bit] NOT NULL CONSTRAINT [DF_Roles_IsPublic]  DEFAULT ((0)),
	[AutoAssignment] [bit] NOT NULL CONSTRAINT [DF_Roles_AutoAssignment]  DEFAULT ((0)),
	[RoleGroupID] [int] NULL,
	[RSVPCode] [nvarchar](50) NULL,
	[IconFile] [nvarchar](100) NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
	[Status] [int] NOT NULL CONSTRAINT [DF_Roles_Status]  DEFAULT ((1)),
	[SecurityMode] [int] NOT NULL CONSTRAINT [DF_Roles_SecurityMode]  DEFAULT ((0)),
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_RoleName] UNIQUE NONCLUSTERED 
(
	[PortalID] ASC,
	[RoleName] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UrlLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UrlLog](
	[UrlLogID] [int] IDENTITY(1,1) NOT NULL,
	[UrlTrackingID] [int] NOT NULL,
	[ClickDate] [datetime] NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_UrlLog] PRIMARY KEY CLUSTERED 
(
	[UrlLogID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FolderMappingsSettings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FolderMappingsSettings](
	[FolderMappingID] [int] NOT NULL,
	[SettingName] [nvarchar](50) NOT NULL,
	[SettingValue] [nvarchar](2000) NOT NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_FolderMappingsSettings] PRIMARY KEY CLUSTERED 
(
	[FolderMappingID] ASC,
	[SettingName] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Packages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Packages](
	[PackageID] [int] IDENTITY(1,1) NOT NULL,
	[PortalID] [int] NULL,
	[Name] [nvarchar](128) NOT NULL,
	[FriendlyName] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[PackageType] [nvarchar](100) NOT NULL,
	[Version] [nvarchar](50) NOT NULL,
	[License] [ntext] NULL,
	[Manifest] [ntext] NULL,
	[Owner] [nvarchar](100) NULL,
	[Organization] [nvarchar](100) NULL,
	[Url] [nvarchar](250) NULL,
	[Email] [nvarchar](100) NULL,
	[ReleaseNotes] [ntext] NULL,
	[IsSystemPackage] [bit] NOT NULL CONSTRAINT [DF_Packages_IsSystemPackage]  DEFAULT ((0)),
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
	[FolderName] [nvarchar](128) NULL,
	[IconFile] [nvarchar](100) NULL,
 CONSTRAINT [PK_Packages] PRIMARY KEY CLUSTERED 
(
	[PackageID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserRoles](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[ExpiryDate] [datetime] NULL,
	[IsTrialUsed] [bit] NULL,
	[EffectiveDate] [datetime] NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
	[Status] [int] NOT NULL CONSTRAINT [DF_UserRoles_Status]  DEFAULT ((1)),
	[IsOwner] [bit] NOT NULL CONSTRAINT [DF_UserRoles_IsOwner]  DEFAULT ((0)),
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventLogConfig]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EventLogConfig](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LogTypeKey] [nvarchar](35) NULL,
	[LogTypePortalID] [int] NULL,
	[LoggingIsActive] [bit] NOT NULL,
	[KeepMostRecent] [int] NOT NULL,
	[EmailNotificationIsActive] [bit] NOT NULL,
	[NotificationThreshold] [int] NULL,
	[NotificationThresholdTime] [int] NULL,
	[NotificationThresholdTimeType] [int] NULL,
	[MailFromAddress] [nvarchar](50) NOT NULL,
	[MailToAddress] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EventLogConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EventLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EventLog](
	[LogGUID] [varchar](36) NOT NULL,
	[LogTypeKey] [nvarchar](35) NOT NULL,
	[LogConfigID] [int] NULL,
	[LogUserID] [int] NULL,
	[LogUserName] [nvarchar](50) NULL,
	[LogPortalID] [int] NULL,
	[LogPortalName] [nvarchar](100) NULL,
	[LogCreateDate] [datetime] NOT NULL,
	[LogServerName] [nvarchar](50) NOT NULL,
	[LogProperties] [ntext] NOT NULL,
	[LogNotificationPending] [bit] NULL,
	[LogEventID] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_EventLogMaster] PRIMARY KEY CLUSTERED 
(
	[LogEventID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tabs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tabs](
	[TabID] [int] IDENTITY(0,1) NOT NULL,
	[TabOrder] [int] NOT NULL CONSTRAINT [DF_Tabs_TabOrder]  DEFAULT ((0)),
	[PortalID] [int] NULL,
	[TabName] [nvarchar](50) NOT NULL,
	[IsVisible] [bit] NOT NULL CONSTRAINT [DF_Tabs_IsVisible]  DEFAULT ((1)),
	[ParentId] [int] NULL,
	[IconFile] [nvarchar](100) NULL,
	[DisableLink] [bit] NOT NULL CONSTRAINT [DF_Tabs_DisableLink]  DEFAULT ((0)),
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[KeyWords] [nvarchar](500) NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Tabs_IsDeleted]  DEFAULT ((0)),
	[Url] [nvarchar](255) NULL,
	[SkinSrc] [nvarchar](200) NULL,
	[ContainerSrc] [nvarchar](200) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[RefreshInterval] [int] NULL,
	[PageHeadText] [nvarchar](max) NULL,
	[IsSecure] [bit] NOT NULL CONSTRAINT [DF_Tabs_IsSecure]  DEFAULT ((0)),
	[PermanentRedirect] [bit] NOT NULL CONSTRAINT [DF_Tabs_PermanentRedirect]  DEFAULT ((0)),
	[SiteMapPriority] [float] NOT NULL CONSTRAINT [DF_Tabs_SiteMapPriority]  DEFAULT ((0.5)),
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
	[IconFileLarge] [nvarchar](100) NULL,
	[CultureCode] [nvarchar](10) NULL,
	[ContentItemID] [int] NULL,
	[UniqueId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Tabs_Guid]  DEFAULT (newid()),
	[VersionGuid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Tabs_VersionGuid]  DEFAULT (newid()),
	[DefaultLanguageGuid] [uniqueidentifier] NULL,
	[LocalizedVersionGuid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Tabs_LocalizedVersionGuid]  DEFAULT (newid()),
	[Level] [int] NOT NULL DEFAULT ((0)),
	[TabPath] [nvarchar](255) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_Tabs] PRIMARY KEY CLUSTERED 
(
	[TabID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Tabs_UniqueId] UNIQUE NONCLUSTERED 
(
	[UniqueId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Modules]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Modules](
	[ModuleID] [int] IDENTITY(0,1) NOT NULL,
	[ModuleDefID] [int] NOT NULL,
	[AllTabs] [bit] NOT NULL CONSTRAINT [DF_Modules_AllTabs]  DEFAULT ((0)),
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Modules_IsDeleted]  DEFAULT ((0)),
	[InheritViewPermissions] [bit] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[PortalID] [int] NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL CONSTRAINT [DF_Modules_CreatedOnDate]  DEFAULT (getdate()),
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL CONSTRAINT [DF_Modules_LastModifiedOnDate]  DEFAULT (getdate()),
	[LastContentModifiedOnDate] [datetime] NOT NULL CONSTRAINT [DF_Modules_LastContentModifiedOnDate]  DEFAULT (getdate()),
	[ContentItemID] [int] NULL,
 CONSTRAINT [PK_Modules] PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VendorClassification]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VendorClassification](
	[VendorClassificationId] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[ClassificationId] [int] NOT NULL,
 CONSTRAINT [PK_VendorClassification] PRIMARY KEY CLUSTERED 
(
	[VendorClassificationId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_VendorClassification] UNIQUE NONCLUSTERED 
(
	[VendorId] ASC,
	[ClassificationId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CoreMessaging_Messages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CoreMessaging_Messages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[PortalID] [int] NULL,
	[NotificationTypeID] [int] NULL,
	[To] [nvarchar](2000) NULL,
	[From] [nvarchar](200) NULL,
	[Subject] [nvarchar](400) NULL,
	[Body] [nvarchar](max) NULL,
	[ConversationID] [int] NULL,
	[ReplyAllAllowed] [bit] NULL,
	[SenderUserID] [int] NULL,
	[ExpirationDate] [datetime] NULL,
	[Context] [nvarchar](200) NULL,
	[IncludeDismissAction] [bit] NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_CoreMessaging_Messages] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CoreMessaging_NotificationTypeActions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CoreMessaging_NotificationTypeActions](
	[NotificationTypeActionID] [int] IDENTITY(1,1) NOT NULL,
	[NotificationTypeID] [int] NOT NULL,
	[NameResourceKey] [nvarchar](100) NOT NULL,
	[DescriptionResourceKey] [nvarchar](100) NULL,
	[ConfirmResourceKey] [nvarchar](100) NULL,
	[Order] [int] NOT NULL,
	[APICall] [nvarchar](500) NOT NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_CoreMessaging_NotificationTypeActions] PRIMARY KEY CLUSTERED 
(
	[NotificationTypeActionID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ModuleSettings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ModuleSettings](
	[ModuleID] [int] NOT NULL,
	[SettingName] [nvarchar](50) NOT NULL,
	[SettingValue] [nvarchar](max) NOT NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_ModuleSettings] PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC,
	[SettingName] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SearchItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SearchItem](
	[SearchItemID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](2000) NOT NULL,
	[Author] [int] NULL,
	[PubDate] [datetime] NOT NULL,
	[ModuleId] [int] NOT NULL,
	[SearchKey] [nvarchar](100) NOT NULL,
	[Guid] [varchar](200) NULL,
	[HitCount] [int] NULL,
	[ImageFileId] [int] NULL,
 CONSTRAINT [PK_SearchItem] PRIMARY KEY CLUSTERED 
(
	[SearchItemID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TabModules]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TabModules](
	[TabModuleID] [int] IDENTITY(1,1) NOT NULL,
	[TabID] [int] NOT NULL,
	[ModuleID] [int] NOT NULL,
	[PaneName] [nvarchar](50) NOT NULL,
	[ModuleOrder] [int] NOT NULL,
	[CacheTime] [int] NOT NULL,
	[Alignment] [nvarchar](10) NULL,
	[Color] [nvarchar](20) NULL,
	[Border] [nvarchar](1) NULL,
	[IconFile] [nvarchar](100) NULL,
	[Visibility] [int] NOT NULL,
	[ContainerSrc] [nvarchar](200) NULL,
	[DisplayTitle] [bit] NOT NULL CONSTRAINT [DF_TabModules_DisplayTitle]  DEFAULT ((1)),
	[DisplayPrint] [bit] NOT NULL CONSTRAINT [DF_TabModules_DisplayPrint]  DEFAULT ((1)),
	[DisplaySyndicate] [bit] NOT NULL CONSTRAINT [DF_TabModules_DisplaySyndicate]  DEFAULT ((1)),
	[IsWebSlice] [bit] NOT NULL CONSTRAINT [DF_abModules_IsWebSlice]  DEFAULT ((0)),
	[WebSliceTitle] [nvarchar](256) NULL,
	[WebSliceExpiryDate] [datetime] NULL,
	[WebSliceTTL] [int] NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL CONSTRAINT [DF_TabModules_CreatedOnDate]  DEFAULT (getdate()),
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL CONSTRAINT [DF_TabModules_LastModifiedOnDate]  DEFAULT (getdate()),
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_TabModules_IsDeleted]  DEFAULT ((0)),
	[CacheMethod] [varchar](50) NULL,
	[ModuleTitle] [nvarchar](256) NULL,
	[Header] [ntext] NULL,
	[Footer] [ntext] NULL,
	[CultureCode] [nvarchar](10) NULL,
	[UniqueId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_TabModules_Guid]  DEFAULT (newid()),
	[VersionGuid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_TabModules_VersionGuid]  DEFAULT (newid()),
	[DefaultLanguageGuid] [uniqueidentifier] NULL,
	[LocalizedVersionGuid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_TabModules_LocalizedVersionGuid]  DEFAULT (newid()),
 CONSTRAINT [PK_TabModules] PRIMARY KEY CLUSTERED 
(
	[TabModuleID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_TabModules] UNIQUE NONCLUSTERED 
(
	[TabID] ASC,
	[ModuleID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_TabModules_UniqueId] UNIQUE NONCLUSTERED 
(
	[UniqueId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Links]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Links](
	[ItemID] [int] IDENTITY(0,1) NOT NULL,
	[ModuleID] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[Title] [nvarchar](100) NULL,
	[Url] [nvarchar](250) NULL,
	[ViewOrder] [int] NULL,
	[Description] [nvarchar](2000) NULL,
	[CreatedByUser] [int] NOT NULL,
 CONSTRAINT [PK__Links__67FE6514] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CoreMessaging_MessageAttachments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CoreMessaging_MessageAttachments](
	[MessageAttachmentID] [int] IDENTITY(1,1) NOT NULL,
	[MessageID] [int] NOT NULL,
	[FileID] [int] NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_CoreMessaging_MessageAttachments] PRIMARY KEY CLUSTERED 
(
	[MessageAttachmentID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CoreMessaging_MessageRecipients]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CoreMessaging_MessageRecipients](
	[RecipientID] [int] IDENTITY(1,1) NOT NULL,
	[MessageID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Read] [bit] NOT NULL DEFAULT ((0)),
	[Archived] [bit] NOT NULL DEFAULT ((0)),
	[EmailSent] [bit] NOT NULL DEFAULT ((0)),
	[EmailSentDate] [datetime] NULL,
	[EmailSchedulerInstance] [uniqueidentifier] NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_CoreMessaging_MessageRecipients] PRIMARY KEY CLUSTERED 
(
	[RecipientID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HtmlTextUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HtmlTextUsers](
	[HtmlTextUserID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[StateID] [int] NOT NULL,
	[ModuleID] [int] NOT NULL,
	[TabID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[CreatedOnDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HtmlTextUsers] PRIMARY KEY CLUSTERED 
(
	[HtmlTextUserID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersOnline]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UsersOnline](
	[UserID] [int] NOT NULL,
	[PortalID] [int] NOT NULL,
	[TabID] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL CONSTRAINT [DF__Users__Creat__3BFFE745]  DEFAULT (getdate()),
	[LastActiveDate] [datetime] NOT NULL CONSTRAINT [DF__Users__LastA__3CF40B7E]  DEFAULT (getdate()),
 CONSTRAINT [PK_UsersOnline] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[PortalID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAuthentication]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserAuthentication](
	[UserAuthenticationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[AuthenticationType] [nvarchar](100) NOT NULL,
	[AuthenticationToken] [nvarchar](1000) NOT NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_UserAuthentication] PRIMARY KEY CLUSTERED 
(
	[UserAuthenticationID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserPortals]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserPortals](
	[UserId] [int] NOT NULL,
	[PortalId] [int] NOT NULL,
	[UserPortalId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_UserPortals_CreatedDate]  DEFAULT (getdate()),
	[Authorised] [bit] NOT NULL CONSTRAINT [DF_UserPortals_Authorised]  DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_UserPortals_IsDeleted]  DEFAULT ((0)),
	[RefreshRoles] [bit] NOT NULL CONSTRAINT [DF_UserPortals_RefreshRoles]  DEFAULT ((0)),
 CONSTRAINT [PK_UserPortals] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[PortalId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Profile]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Profile](
	[ProfileId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PortalId] [int] NOT NULL,
	[ProfileData] [ntext] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[ProfileId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ModuleDefinitions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ModuleDefinitions](
	[ModuleDefID] [int] IDENTITY(1,1) NOT NULL,
	[FriendlyName] [nvarchar](128) NOT NULL,
	[DesktopModuleID] [int] NOT NULL,
	[DefaultCacheTime] [int] NOT NULL CONSTRAINT [DF_ModuleDefinitions_DefaultCacheTime]  DEFAULT ((0)),
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_ModuleDefinitions] PRIMARY KEY CLUSTERED 
(
	[ModuleDefID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_ModuleDefinitions] UNIQUE NONCLUSTERED 
(
	[FriendlyName] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CoreMessaging_NotificationTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CoreMessaging_NotificationTypes](
	[NotificationTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[TTL] [int] NULL,
	[DesktopModuleID] [int] NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_CoreMessaging_NotificationTypes] PRIMARY KEY CLUSTERED 
(
	[NotificationTypeID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PortalDesktopModules]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PortalDesktopModules](
	[PortalDesktopModuleID] [int] IDENTITY(1,1) NOT NULL,
	[PortalID] [int] NOT NULL,
	[DesktopModuleID] [int] NOT NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_PortalDesktopModules] PRIMARY KEY CLUSTERED 
(
	[PortalDesktopModuleID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_PortalDesktopModules] UNIQUE NONCLUSTERED 
(
	[PortalID] ASC,
	[DesktopModuleID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mobile_RedirectionRules]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mobile_RedirectionRules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RedirectionId] [int] NOT NULL,
	[Capability] [nvarchar](50) NOT NULL,
	[Expression] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Mobile_RedirectionRules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Banners]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Banners](
	[BannerId] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[ImageFile] [nvarchar](100) NULL,
	[BannerName] [nvarchar](100) NOT NULL,
	[Impressions] [int] NOT NULL,
	[CPM] [float] NOT NULL,
	[Views] [int] NOT NULL CONSTRAINT [DF_Banners_Views]  DEFAULT ((0)),
	[ClickThroughs] [int] NOT NULL CONSTRAINT [DF_Banners_ClickThroughs]  DEFAULT ((0)),
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CreatedByUser] [nvarchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[BannerTypeId] [int] NULL,
	[Description] [nvarchar](2000) NULL,
	[GroupName] [nvarchar](100) NULL,
	[Criteria] [bit] NOT NULL CONSTRAINT [DF_Banners_Criteria]  DEFAULT ((1)),
	[URL] [nvarchar](255) NULL,
	[Width] [int] NOT NULL CONSTRAINT [DF_Banners_Width]  DEFAULT ((0)),
	[Height] [int] NOT NULL CONSTRAINT [DF_Banners_Height]  DEFAULT ((0)),
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[BannerId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Affiliates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Affiliates](
	[AffiliateId] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CPC] [float] NOT NULL,
	[Clicks] [int] NOT NULL,
	[CPA] [float] NOT NULL,
	[Acquisitions] [int] NOT NULL,
 CONSTRAINT [PK_Affiliates] PRIMARY KEY CLUSTERED 
(
	[AffiliateId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Taxonomy_Terms]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Taxonomy_Terms](
	[TermID] [int] IDENTITY(1,1) NOT NULL,
	[VocabularyID] [int] NOT NULL,
	[ParentTermID] [int] NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](2500) NULL,
	[Weight] [int] NOT NULL CONSTRAINT [DF_Taxonomy_Terms_Weight]  DEFAULT ((0)),
	[TermLeft] [int] NOT NULL CONSTRAINT [DF_Taxonomy_Terms_TermLeft]  DEFAULT ((0)),
	[TermRight] [int] NOT NULL CONSTRAINT [DF_Taxonomy_Terms_TermRight]  DEFAULT ((0)),
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_Taxonomy_Terms] PRIMARY KEY CLUSTERED 
(
	[TermID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContentItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ContentItems](
	[ContentItemID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[ContentTypeID] [int] NOT NULL,
	[TabID] [int] NOT NULL,
	[ModuleID] [int] NOT NULL,
	[ContentKey] [nvarchar](250) NULL,
	[Indexed] [bit] NOT NULL CONSTRAINT [DF_ContentItems_Indexed]  DEFAULT ((0)),
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_ContentItems] PRIMARY KEY CLUSTERED 
(
	[ContentItemID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TabSettings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TabSettings](
	[TabID] [int] NOT NULL,
	[SettingName] [nvarchar](50) NOT NULL,
	[SettingValue] [nvarchar](2000) NOT NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ModuleControls]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ModuleControls](
	[ModuleControlID] [int] IDENTITY(1,1) NOT NULL,
	[ModuleDefID] [int] NULL,
	[ControlKey] [nvarchar](50) NULL,
	[ControlTitle] [nvarchar](50) NULL,
	[ControlSrc] [nvarchar](256) NULL,
	[IconFile] [nvarchar](100) NULL,
	[ControlType] [int] NOT NULL,
	[ViewOrder] [int] NULL,
	[HelpUrl] [nvarchar](200) NULL,
	[SupportsPartialRendering] [bit] NOT NULL CONSTRAINT [DF_ModuleControls_SupportsPartialRendering]  DEFAULT ((0)),
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
	[SupportsPopUps] [bit] NOT NULL CONSTRAINT [DF_ModuleControls_SupportsPopUps]  DEFAULT ((0)),
 CONSTRAINT [PK_ModuleControls] PRIMARY KEY CLUSTERED 
(
	[ModuleControlID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_ModuleControls] UNIQUE NONCLUSTERED 
(
	[ModuleDefID] ASC,
	[ControlKey] ASC,
	[ControlSrc] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PortalAlias]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PortalAlias](
	[PortalAliasID] [int] IDENTITY(1,1) NOT NULL,
	[PortalID] [int] NOT NULL,
	[HTTPAlias] [nvarchar](200) NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_PortalAlias] PRIMARY KEY CLUSTERED 
(
	[PortalAliasID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_PortalAlias] UNIQUE NONCLUSTERED 
(
	[HTTPAlias] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SiteLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SiteLog](
	[SiteLogId] [int] IDENTITY(1,1) NOT NULL,
	[DateTime] [smalldatetime] NOT NULL,
	[PortalId] [int] NOT NULL,
	[UserId] [int] NULL,
	[Referrer] [nvarchar](255) NULL,
	[Url] [nvarchar](255) NULL,
	[UserAgent] [nvarchar](255) NULL,
	[UserHostAddress] [nvarchar](255) NULL,
	[UserHostName] [nvarchar](255) NULL,
	[TabId] [int] NULL,
	[AffiliateId] [int] NULL,
 CONSTRAINT [PK_SiteLog] PRIMARY KEY CLUSTERED 
(
	[SiteLogId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mobile_PreviewProfiles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mobile_PreviewProfiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PortalId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Width] [int] NOT NULL,
	[Height] [int] NOT NULL,
	[UserAgent] [nvarchar](260) NOT NULL,
	[SortOrder] [int] NOT NULL CONSTRAINT [DF_Mobile_PreviewProfiles_SortOrder]  DEFAULT ((0)),
	[CreatedByUserID] [int] NOT NULL,
	[CreatedOnDate] [datetime] NOT NULL CONSTRAINT [DF_Mobile_PreviewProfiles_CreatedOnDate]  DEFAULT (getdate()),
	[LastModifiedByUserID] [int] NOT NULL,
	[LastModifiedOnDate] [datetime] NOT NULL CONSTRAINT [DF_Mobile_PreviewProfiles_LastModifiedOnDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Mobile_PreviewProfiles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mobile_Redirections]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mobile_Redirections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PortalId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Type] [int] NOT NULL,
	[SortOrder] [int] NOT NULL CONSTRAINT [DF_Mobile_Redirections_SortOrder]  DEFAULT ((0)),
	[SourceTabId] [int] NOT NULL,
	[IncludeChildTabs] [bit] NOT NULL,
	[TargetType] [int] NOT NULL,
	[TargetValue] [nvarchar](260) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[CreatedByUserID] [int] NOT NULL,
	[CreatedOnDate] [datetime] NOT NULL CONSTRAINT [DF_Mobile_Redirections_CreatedOnDate]  DEFAULT (getdate()),
	[LastModifiedByUserID] [int] NOT NULL,
	[LastModifiedOnDate] [datetime] NOT NULL CONSTRAINT [DF_Mobile_Redirections_LastModifiedOnDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Mobile_Redirections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendors]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vendors](
	[VendorId] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [nvarchar](50) NOT NULL,
	[Street] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Region] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[Telephone] [nvarchar](50) NULL,
	[PortalId] [int] NULL,
	[Fax] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Website] [nvarchar](100) NULL,
	[ClickThroughs] [int] NOT NULL CONSTRAINT [DF_Vendors_ClickThroughs]  DEFAULT ((0)),
	[Views] [int] NOT NULL CONSTRAINT [DF_Vendors_Views]  DEFAULT ((0)),
	[CreatedByUser] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[LogoFile] [nvarchar](100) NULL,
	[KeyWords] [ntext] NULL,
	[Unit] [nvarchar](50) NULL,
	[Authorized] [bit] NOT NULL CONSTRAINT [DF_Vendors_Authorized]  DEFAULT ((1)),
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Cell] [varchar](50) NULL,
 CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED 
(
	[VendorId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Vendors] UNIQUE NONCLUSTERED 
(
	[PortalId] ASC,
	[VendorName] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AnonymousUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AnonymousUsers](
	[UserID] [char](36) NOT NULL,
	[PortalID] [int] NOT NULL,
	[TabID] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL CONSTRAINT [DF_AnonymousUsers_CreationDate]  DEFAULT (getdate()),
	[LastActiveDate] [datetime] NOT NULL CONSTRAINT [DF_AnonymousUsers_LastActiveDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_AnonymousUsers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[PortalID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemMessages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SystemMessages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[PortalID] [int] NULL,
	[MessageName] [nvarchar](50) NOT NULL,
	[MessageValue] [ntext] NOT NULL,
 CONSTRAINT [PK_SystemMessages] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_SystemMessages] UNIQUE NONCLUSTERED 
(
	[MessageName] ASC,
	[PortalID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProfilePropertyDefinition]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProfilePropertyDefinition](
	[PropertyDefinitionID] [int] IDENTITY(1,1) NOT NULL,
	[PortalID] [int] NULL,
	[ModuleDefID] [int] NULL,
	[Deleted] [bit] NOT NULL,
	[DataType] [int] NOT NULL,
	[DefaultValue] [ntext] NULL,
	[PropertyCategory] [nvarchar](50) NOT NULL,
	[PropertyName] [nvarchar](50) NOT NULL,
	[Length] [int] NOT NULL CONSTRAINT [DF_ProfilePropertyDefinition_Length]  DEFAULT ((0)),
	[Required] [bit] NOT NULL,
	[ValidationExpression] [nvarchar](2000) NULL,
	[ViewOrder] [int] NOT NULL,
	[Visible] [bit] NOT NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
	[DefaultVisibility] [int] NULL,
	[ReadOnly] [bit] NOT NULL CONSTRAINT [DF_ProfilePropertyDefinition_ReadOnly]  DEFAULT ((0)),
 CONSTRAINT [PK_ProfilePropertyDefinition] PRIMARY KEY CLUSTERED 
(
	[PropertyDefinitionID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Folders]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Folders](
	[FolderID] [int] IDENTITY(1,1) NOT NULL,
	[PortalID] [int] NULL,
	[FolderPath] [nvarchar](300) NOT NULL,
	[StorageLocation] [int] NOT NULL CONSTRAINT [DF_Folders_StorageLocation]  DEFAULT ((0)),
	[IsProtected] [bit] NOT NULL CONSTRAINT [DF_Folders_IsProtected]  DEFAULT ((0)),
	[IsCached] [bit] NOT NULL CONSTRAINT [DF_Folders_IsCached]  DEFAULT ((0)),
	[LastUpdated] [datetime] NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
	[UniqueId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Folders_UniqueId]  DEFAULT (newid()),
	[VersionGuid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Folders_VersionGuid]  DEFAULT (newid()),
	[FolderMappingID] [int] NOT NULL,
 CONSTRAINT [PK_Folders] PRIMARY KEY CLUSTERED 
(
	[FolderID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_FolderPath] UNIQUE NONCLUSTERED 
(
	[PortalID] ASC,
	[FolderPath] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Folders_UniqueId] UNIQUE NONCLUSTERED 
(
	[UniqueId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PortalLocalization]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PortalLocalization](
	[PortalID] [int] NOT NULL,
	[CultureCode] [nvarchar](10) NOT NULL,
	[PortalName] [nvarchar](128) NOT NULL,
	[LogoFile] [nvarchar](50) NULL,
	[FooterText] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[KeyWords] [nvarchar](500) NULL,
	[BackgroundFile] [nvarchar](50) NULL,
	[HomeTabId] [int] NULL,
	[LoginTabId] [int] NULL,
	[UserTabId] [int] NULL,
	[AdminTabId] [int] NULL,
	[SplashTabId] [int] NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
	[RegisterTabId] [int] NULL,
	[SearchTabId] [int] NULL,
 CONSTRAINT [PK_PortalLocalization] PRIMARY KEY CLUSTERED 
(
	[PortalID] ASC,
	[CultureCode] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PortalSettings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PortalSettings](
	[PortalID] [int] NOT NULL,
	[SettingName] [nvarchar](50) NOT NULL,
	[SettingValue] [nvarchar](2000) NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
	[CultureCode] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_PortalSettings] PRIMARY KEY CLUSTERED 
(
	[PortalID] ASC,
	[SettingName] ASC,
	[CultureCode] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RoleGroups](
	[RoleGroupID] [int] IDENTITY(0,1) NOT NULL,
	[PortalID] [int] NOT NULL,
	[RoleGroupName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_RoleGroups] PRIMARY KEY CLUSTERED 
(
	[RoleGroupID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_RoleGroupName] UNIQUE NONCLUSTERED 
(
	[PortalID] ASC,
	[RoleGroupName] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UrlTracking]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UrlTracking](
	[UrlTrackingID] [int] IDENTITY(1,1) NOT NULL,
	[PortalID] [int] NULL,
	[Url] [nvarchar](255) NOT NULL,
	[UrlType] [char](1) NOT NULL,
	[Clicks] [int] NOT NULL,
	[LastClick] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LogActivity] [bit] NOT NULL,
	[TrackClicks] [bit] NOT NULL CONSTRAINT [DF_UrlTracking_TrackClicks]  DEFAULT ((1)),
	[ModuleId] [int] NULL,
	[NewWindow] [bit] NOT NULL CONSTRAINT [DF_UrlTracking_NewWindow]  DEFAULT ((0)),
 CONSTRAINT [PK_UrlTracking] PRIMARY KEY CLUSTERED 
(
	[UrlTrackingID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_UrlTracking] UNIQUE NONCLUSTERED 
(
	[PortalID] ASC,
	[Url] ASC,
	[ModuleId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FolderMappings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FolderMappings](
	[FolderMappingID] [int] IDENTITY(1,1) NOT NULL,
	[PortalID] [int] NULL,
	[MappingName] [nvarchar](50) NOT NULL,
	[FolderProviderType] [nvarchar](50) NOT NULL,
	[Priority] [int] NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
 CONSTRAINT [PK_FolderMappings] PRIMARY KEY CLUSTERED 
(
	[FolderMappingID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_FolderMappings] UNIQUE NONCLUSTERED 
(
	[PortalID] ASC,
	[MappingName] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Urls]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Urls](
	[UrlID] [int] IDENTITY(1,1) NOT NULL,
	[PortalID] [int] NULL,
	[Url] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Urls] PRIMARY KEY CLUSTERED 
(
	[UrlID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Urls] UNIQUE NONCLUSTERED 
(
	[Url] ASC,
	[PortalID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Journal_Data]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Journal_Data](
	[JournalDataId] [int] IDENTITY(1,1) NOT NULL,
	[JournalId] [int] NOT NULL,
	[JournalXML] [xml] NOT NULL,
 CONSTRAINT [PK_Journal_Data] PRIMARY KEY CLUSTERED 
(
	[JournalDataId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Journal_Comments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Journal_Comments](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[JournalId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Comment] [nvarchar](2000) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[CommentXML] [xml] NULL,
 CONSTRAINT [PK_Journal_Comments] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Journal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Journal](
	[JournalId] [int] IDENTITY(1,1) NOT NULL,
	[JournalTypeId] [int] NOT NULL,
	[UserId] [int] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[PortalId] [int] NULL,
	[ProfileId] [int] NOT NULL CONSTRAINT [DF_Journal_ProfileId]  DEFAULT ((-1)),
	[GroupId] [int] NOT NULL CONSTRAINT [DF_Journal_GroupId]  DEFAULT ((-1)),
	[Title] [nvarchar](255) NULL,
	[Summary] [nvarchar](2000) NULL,
	[ItemData] [nvarchar](2000) NULL,
	[ImageURL] [nvarchar](255) NULL,
	[ObjectKey] [nvarchar](255) NULL,
	[AccessKey] [uniqueidentifier] NULL,
	[ContentItemId] [int] NULL,
 CONSTRAINT [PK_Journal] PRIMARY KEY CLUSTERED 
(
	[JournalId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Skins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Skins](
	[SkinID] [int] IDENTITY(1,1) NOT NULL,
	[SkinPackageID] [int] NOT NULL,
	[SkinSrc] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Skins] PRIMARY KEY CLUSTERED 
(
	[SkinID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Classification_Classification]') AND parent_object_id = OBJECT_ID(N'[dbo].[Classification]'))
ALTER TABLE [dbo].[Classification]  WITH CHECK ADD  CONSTRAINT [FK_Classification_Classification] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Classification] ([ClassificationId])
GO
ALTER TABLE [dbo].[Classification] CHECK CONSTRAINT [FK_Classification_Classification]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Ro__Appli__3CDEFCE5]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]'))
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Me__Appli__1E5A75C5]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]'))
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Me__UserI__1F4E99FE]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]'))
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__Appli__0E240DFC]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Users]'))
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ScheduleHistory_Schedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[ScheduleHistory]'))
ALTER TABLE [dbo].[ScheduleHistory]  WITH NOCHECK ADD  CONSTRAINT [FK_ScheduleHistory_Schedule] FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[Schedule] ([ScheduleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ScheduleHistory] CHECK CONSTRAINT [FK_ScheduleHistory_Schedule]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ScheduleItemSettings_Schedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[ScheduleItemSettings]'))
ALTER TABLE [dbo].[ScheduleItemSettings]  WITH NOCHECK ADD  CONSTRAINT [FK_ScheduleItemSettings_Schedule] FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[Schedule] ([ScheduleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ScheduleItemSettings] CHECK CONSTRAINT [FK_ScheduleItemSettings_Schedule]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DesktopModulePermission_Permission]') AND parent_object_id = OBJECT_ID(N'[dbo].[DesktopModulePermission]'))
ALTER TABLE [dbo].[DesktopModulePermission]  WITH CHECK ADD  CONSTRAINT [FK_DesktopModulePermission_Permission] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permission] ([PermissionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DesktopModulePermission] CHECK CONSTRAINT [FK_DesktopModulePermission_Permission]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DesktopModulePermission_PortalDesktopModules]') AND parent_object_id = OBJECT_ID(N'[dbo].[DesktopModulePermission]'))
ALTER TABLE [dbo].[DesktopModulePermission]  WITH CHECK ADD  CONSTRAINT [FK_DesktopModulePermission_PortalDesktopModules] FOREIGN KEY([PortalDesktopModuleID])
REFERENCES [dbo].[PortalDesktopModules] ([PortalDesktopModuleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DesktopModulePermission] CHECK CONSTRAINT [FK_DesktopModulePermission_PortalDesktopModules]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DesktopModulePermissionUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[DesktopModulePermission]'))
ALTER TABLE [dbo].[DesktopModulePermission]  WITH CHECK ADD  CONSTRAINT [FK_DesktopModulePermissionUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[DesktopModulePermission] CHECK CONSTRAINT [FK_DesktopModulePermissionUsers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ModulePermission_Modules]') AND parent_object_id = OBJECT_ID(N'[dbo].[ModulePermission]'))
ALTER TABLE [dbo].[ModulePermission]  WITH CHECK ADD  CONSTRAINT [FK_ModulePermission_Modules] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[Modules] ([ModuleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ModulePermission] CHECK CONSTRAINT [FK_ModulePermission_Modules]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ModulePermission_Permission]') AND parent_object_id = OBJECT_ID(N'[dbo].[ModulePermission]'))
ALTER TABLE [dbo].[ModulePermission]  WITH CHECK ADD  CONSTRAINT [FK_ModulePermission_Permission] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permission] ([PermissionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ModulePermission] CHECK CONSTRAINT [FK_ModulePermission_Permission]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ModulePermissionUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[ModulePermission]'))
ALTER TABLE [dbo].[ModulePermission]  WITH CHECK ADD  CONSTRAINT [FK_ModulePermissionUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ModulePermission] CHECK CONSTRAINT [FK_ModulePermissionUsers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TabPermission_Permission]') AND parent_object_id = OBJECT_ID(N'[dbo].[TabPermission]'))
ALTER TABLE [dbo].[TabPermission]  WITH CHECK ADD  CONSTRAINT [FK_TabPermission_Permission] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permission] ([PermissionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TabPermission] CHECK CONSTRAINT [FK_TabPermission_Permission]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TabPermission_Tabs]') AND parent_object_id = OBJECT_ID(N'[dbo].[TabPermission]'))
ALTER TABLE [dbo].[TabPermission]  WITH CHECK ADD  CONSTRAINT [FK_TabPermission_Tabs] FOREIGN KEY([TabID])
REFERENCES [dbo].[Tabs] ([TabID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TabPermission] CHECK CONSTRAINT [FK_TabPermission_Tabs]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TabPermission_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[TabPermission]'))
ALTER TABLE [dbo].[TabPermission]  WITH CHECK ADD  CONSTRAINT [FK_TabPermission_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[TabPermission] CHECK CONSTRAINT [FK_TabPermission_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FolderPermission_Folders]') AND parent_object_id = OBJECT_ID(N'[dbo].[FolderPermission]'))
ALTER TABLE [dbo].[FolderPermission]  WITH CHECK ADD  CONSTRAINT [FK_FolderPermission_Folders] FOREIGN KEY([FolderID])
REFERENCES [dbo].[Folders] ([FolderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FolderPermission] CHECK CONSTRAINT [FK_FolderPermission_Folders]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FolderPermission_Permission]') AND parent_object_id = OBJECT_ID(N'[dbo].[FolderPermission]'))
ALTER TABLE [dbo].[FolderPermission]  WITH CHECK ADD  CONSTRAINT [FK_FolderPermission_Permission] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permission] ([PermissionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FolderPermission] CHECK CONSTRAINT [FK_FolderPermission_Permission]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FolderPermissionUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[FolderPermission]'))
ALTER TABLE [dbo].[FolderPermission]  WITH CHECK ADD  CONSTRAINT [FK_FolderPermissionUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FolderPermission] CHECK CONSTRAINT [FK_FolderPermissionUsers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pr__UserI__335592AB]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Profile]'))
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__RoleI__41A3B202]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__UserI__40AF8DC9]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Files_Folders]') AND parent_object_id = OBJECT_ID(N'[dbo].[Files]'))
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_Files_Folders] FOREIGN KEY([FolderID])
REFERENCES [dbo].[Folders] ([FolderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_Files_Folders]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Files_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[Files]'))
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_Files_Portals] FOREIGN KEY([PortalId])
REFERENCES [dbo].[Portals] ([PortalID])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_Files_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LanguagePacks_Languages]') AND parent_object_id = OBJECT_ID(N'[dbo].[LanguagePacks]'))
ALTER TABLE [dbo].[LanguagePacks]  WITH NOCHECK ADD  CONSTRAINT [FK_LanguagePacks_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LanguagePacks] CHECK CONSTRAINT [FK_LanguagePacks_Languages]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LanguagePacks_Packages]') AND parent_object_id = OBJECT_ID(N'[dbo].[LanguagePacks]'))
ALTER TABLE [dbo].[LanguagePacks]  WITH CHECK ADD  CONSTRAINT [FK_LanguagePacks_Packages] FOREIGN KEY([PackageID])
REFERENCES [dbo].[Packages] ([PackageID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LanguagePacks] CHECK CONSTRAINT [FK_LanguagePacks_Packages]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PortalLanguages_PortalLanguages]') AND parent_object_id = OBJECT_ID(N'[dbo].[PortalLanguages]'))
ALTER TABLE [dbo].[PortalLanguages]  WITH NOCHECK ADD  CONSTRAINT [FK_PortalLanguages_PortalLanguages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PortalLanguages] CHECK CONSTRAINT [FK_PortalLanguages_PortalLanguages]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PortalLanguages_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[PortalLanguages]'))
ALTER TABLE [dbo].[PortalLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PortalLanguages_Portals] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PortalLanguages] CHECK CONSTRAINT [FK_PortalLanguages_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkflowStates_Workflow]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkflowStates]'))
ALTER TABLE [dbo].[WorkflowStates]  WITH NOCHECK ADD  CONSTRAINT [FK_WorkflowStates_Workflow] FOREIGN KEY([WorkflowID])
REFERENCES [dbo].[Workflow] ([WorkflowID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkflowStates] CHECK CONSTRAINT [FK_WorkflowStates_Workflow]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Relationships_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[Relationships]'))
ALTER TABLE [dbo].[Relationships]  WITH CHECK ADD  CONSTRAINT [FK_Relationships_Portals] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Relationships] CHECK CONSTRAINT [FK_Relationships_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Relationships_RelationshipTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Relationships]'))
ALTER TABLE [dbo].[Relationships]  WITH CHECK ADD  CONSTRAINT [FK_Relationships_RelationshipTypes] FOREIGN KEY([RelationshipTypeID])
REFERENCES [dbo].[RelationshipTypes] ([RelationshipTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Relationships] CHECK CONSTRAINT [FK_Relationships_RelationshipTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Relationships_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Relationships]'))
ALTER TABLE [dbo].[Relationships]  WITH CHECK ADD  CONSTRAINT [FK_Relationships_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Relationships] CHECK CONSTRAINT [FK_Relationships_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HtmlTextLog_HtmlText]') AND parent_object_id = OBJECT_ID(N'[dbo].[HtmlTextLog]'))
ALTER TABLE [dbo].[HtmlTextLog]  WITH NOCHECK ADD  CONSTRAINT [FK_HtmlTextLog_HtmlText] FOREIGN KEY([ItemID])
REFERENCES [dbo].[HtmlText] ([ItemID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HtmlTextLog] CHECK CONSTRAINT [FK_HtmlTextLog_HtmlText]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HtmlTextLog_WorkflowStates]') AND parent_object_id = OBJECT_ID(N'[dbo].[HtmlTextLog]'))
ALTER TABLE [dbo].[HtmlTextLog]  WITH NOCHECK ADD  CONSTRAINT [FK_HtmlTextLog_WorkflowStates] FOREIGN KEY([StateID])
REFERENCES [dbo].[WorkflowStates] ([StateID])
GO
ALTER TABLE [dbo].[HtmlTextLog] CHECK CONSTRAINT [FK_HtmlTextLog_WorkflowStates]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HtmlText_Modules]') AND parent_object_id = OBJECT_ID(N'[dbo].[HtmlText]'))
ALTER TABLE [dbo].[HtmlText]  WITH CHECK ADD  CONSTRAINT [FK_HtmlText_Modules] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[Modules] ([ModuleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HtmlText] CHECK CONSTRAINT [FK_HtmlText_Modules]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HtmlText_WorkflowStates]') AND parent_object_id = OBJECT_ID(N'[dbo].[HtmlText]'))
ALTER TABLE [dbo].[HtmlText]  WITH NOCHECK ADD  CONSTRAINT [FK_HtmlText_WorkflowStates] FOREIGN KEY([StateID])
REFERENCES [dbo].[WorkflowStates] ([StateID])
GO
ALTER TABLE [dbo].[HtmlText] CHECK CONSTRAINT [FK_HtmlText_WorkflowStates]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SearchItemWord_SearchItem]') AND parent_object_id = OBJECT_ID(N'[dbo].[SearchItemWord]'))
ALTER TABLE [dbo].[SearchItemWord]  WITH CHECK ADD  CONSTRAINT [FK_SearchItemWord_SearchItem] FOREIGN KEY([SearchItemID])
REFERENCES [dbo].[SearchItem] ([SearchItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SearchItemWord] CHECK CONSTRAINT [FK_SearchItemWord_SearchItem]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SearchItemWord_SearchWord]') AND parent_object_id = OBJECT_ID(N'[dbo].[SearchItemWord]'))
ALTER TABLE [dbo].[SearchItemWord]  WITH CHECK ADD  CONSTRAINT [FK_SearchItemWord_SearchWord] FOREIGN KEY([SearchWordsID])
REFERENCES [dbo].[SearchWord] ([SearchWordsID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SearchItemWord] CHECK CONSTRAINT [FK_SearchItemWord_SearchWord]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserProfile_ProfilePropertyDefinition]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserProfile]'))
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_ProfilePropertyDefinition] FOREIGN KEY([PropertyDefinitionID])
REFERENCES [dbo].[ProfilePropertyDefinition] ([PropertyDefinitionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_ProfilePropertyDefinition]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserProfile_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserProfile]'))
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContentItems_MetaData_ContentItems]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContentItems_MetaData]'))
ALTER TABLE [dbo].[ContentItems_MetaData]  WITH CHECK ADD  CONSTRAINT [FK_ContentItems_MetaData_ContentItems] FOREIGN KEY([ContentItemID])
REFERENCES [dbo].[ContentItems] ([ContentItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ContentItems_MetaData] CHECK CONSTRAINT [FK_ContentItems_MetaData_ContentItems]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContentItems_MetaDataMetaData]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContentItems_MetaData]'))
ALTER TABLE [dbo].[ContentItems_MetaData]  WITH NOCHECK ADD  CONSTRAINT [FK_ContentItems_MetaDataMetaData] FOREIGN KEY([MetaDataID])
REFERENCES [dbo].[MetaData] ([MetaDataID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ContentItems_MetaData] CHECK CONSTRAINT [FK_ContentItems_MetaDataMetaData]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRelationships_Relationships]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRelationships]'))
ALTER TABLE [dbo].[UserRelationships]  WITH CHECK ADD  CONSTRAINT [FK_UserRelationships_Relationships] FOREIGN KEY([RelationshipID])
REFERENCES [dbo].[Relationships] ([RelationshipID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRelationships] CHECK CONSTRAINT [FK_UserRelationships_Relationships]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRelationships_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRelationships]'))
ALTER TABLE [dbo].[UserRelationships]  WITH CHECK ADD  CONSTRAINT [FK_UserRelationships_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserRelationships] CHECK CONSTRAINT [FK_UserRelationships_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRelationships_Users_OnRelatedUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRelationships]'))
ALTER TABLE [dbo].[UserRelationships]  WITH CHECK ADD  CONSTRAINT [FK_UserRelationships_Users_OnRelatedUser] FOREIGN KEY([RelatedUserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserRelationships] CHECK CONSTRAINT [FK_UserRelationships_Users_OnRelatedUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRelationshipPreferences_Relationships]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRelationshipPreferences]'))
ALTER TABLE [dbo].[UserRelationshipPreferences]  WITH CHECK ADD  CONSTRAINT [FK_UserRelationshipPreferences_Relationships] FOREIGN KEY([RelationshipID])
REFERENCES [dbo].[Relationships] ([RelationshipID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRelationshipPreferences] CHECK CONSTRAINT [FK_UserRelationshipPreferences_Relationships]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRelationshipPreferences_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRelationshipPreferences]'))
ALTER TABLE [dbo].[UserRelationshipPreferences]  WITH CHECK ADD  CONSTRAINT [FK_UserRelationshipPreferences_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserRelationshipPreferences] CHECK CONSTRAINT [FK_UserRelationshipPreferences_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContentItems_Tags_ContentItems]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContentItems_Tags]'))
ALTER TABLE [dbo].[ContentItems_Tags]  WITH CHECK ADD  CONSTRAINT [FK_ContentItems_Tags_ContentItems] FOREIGN KEY([ContentItemID])
REFERENCES [dbo].[ContentItems] ([ContentItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ContentItems_Tags] CHECK CONSTRAINT [FK_ContentItems_Tags_ContentItems]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContentItems_Tags_Taxonomy_Terms]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContentItems_Tags]'))
ALTER TABLE [dbo].[ContentItems_Tags]  WITH CHECK ADD  CONSTRAINT [FK_ContentItems_Tags_Taxonomy_Terms] FOREIGN KEY([TermID])
REFERENCES [dbo].[Taxonomy_Terms] ([TermID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ContentItems_Tags] CHECK CONSTRAINT [FK_ContentItems_Tags_Taxonomy_Terms]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Taxonomy_Vocabularies_Taxonomy_ScopeTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Taxonomy_Vocabularies]'))
ALTER TABLE [dbo].[Taxonomy_Vocabularies]  WITH CHECK ADD  CONSTRAINT [FK_Taxonomy_Vocabularies_Taxonomy_ScopeTypes] FOREIGN KEY([ScopeTypeID])
REFERENCES [dbo].[Taxonomy_ScopeTypes] ([ScopeTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Taxonomy_Vocabularies] CHECK CONSTRAINT [FK_Taxonomy_Vocabularies_Taxonomy_ScopeTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Taxonomy_Vocabularies_Taxonomy_VocabularyTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Taxonomy_Vocabularies]'))
ALTER TABLE [dbo].[Taxonomy_Vocabularies]  WITH CHECK ADD  CONSTRAINT [FK_Taxonomy_Vocabularies_Taxonomy_VocabularyTypes] FOREIGN KEY([VocabularyTypeID])
REFERENCES [dbo].[Taxonomy_VocabularyTypes] ([VocabularyTypeID])
GO
ALTER TABLE [dbo].[Taxonomy_Vocabularies] CHECK CONSTRAINT [FK_Taxonomy_Vocabularies_Taxonomy_VocabularyTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SearchItemWordPosition_SearchItemWord]') AND parent_object_id = OBJECT_ID(N'[dbo].[SearchItemWordPosition]'))
ALTER TABLE [dbo].[SearchItemWordPosition]  WITH CHECK ADD  CONSTRAINT [FK_SearchItemWordPosition_SearchItemWord] FOREIGN KEY([SearchItemWordID])
REFERENCES [dbo].[SearchItemWord] ([SearchItemWordID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SearchItemWordPosition] CHECK CONSTRAINT [FK_SearchItemWordPosition_SearchItemWord]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TabModuleSettings_TabModules]') AND parent_object_id = OBJECT_ID(N'[dbo].[TabModuleSettings]'))
ALTER TABLE [dbo].[TabModuleSettings]  WITH CHECK ADD  CONSTRAINT [FK_TabModuleSettings_TabModules] FOREIGN KEY([TabModuleID])
REFERENCES [dbo].[TabModules] ([TabModuleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TabModuleSettings] CHECK CONSTRAINT [FK_TabModuleSettings_TabModules]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PackageAssemblies_PackageAssemblies]') AND parent_object_id = OBJECT_ID(N'[dbo].[Assemblies]'))
ALTER TABLE [dbo].[Assemblies]  WITH CHECK ADD  CONSTRAINT [FK_PackageAssemblies_PackageAssemblies] FOREIGN KEY([PackageID])
REFERENCES [dbo].[Packages] ([PackageID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Assemblies] CHECK CONSTRAINT [FK_PackageAssemblies_PackageAssemblies]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SkinControls_Packages]') AND parent_object_id = OBJECT_ID(N'[dbo].[SkinControls]'))
ALTER TABLE [dbo].[SkinControls]  WITH NOCHECK ADD  CONSTRAINT [FK_SkinControls_Packages] FOREIGN KEY([PackageID])
REFERENCES [dbo].[Packages] ([PackageID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SkinControls] CHECK CONSTRAINT [FK_SkinControls_Packages]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Authentication_Packages]') AND parent_object_id = OBJECT_ID(N'[dbo].[Authentication]'))
ALTER TABLE [dbo].[Authentication]  WITH NOCHECK ADD  CONSTRAINT [FK_Authentication_Packages] FOREIGN KEY([PackageID])
REFERENCES [dbo].[Packages] ([PackageID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authentication] CHECK CONSTRAINT [FK_Authentication_Packages]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Dashboard_Controls_Packages]') AND parent_object_id = OBJECT_ID(N'[dbo].[Dashboard_Controls]'))
ALTER TABLE [dbo].[Dashboard_Controls]  WITH NOCHECK ADD  CONSTRAINT [FK_Dashboard_Controls_Packages] FOREIGN KEY([PackageID])
REFERENCES [dbo].[Packages] ([PackageID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Dashboard_Controls] CHECK CONSTRAINT [FK_Dashboard_Controls_Packages]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SkinPackages_Packages]') AND parent_object_id = OBJECT_ID(N'[dbo].[SkinPackages]'))
ALTER TABLE [dbo].[SkinPackages]  WITH NOCHECK ADD  CONSTRAINT [FK_SkinPackages_Packages] FOREIGN KEY([PackageID])
REFERENCES [dbo].[Packages] ([PackageID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SkinPackages] CHECK CONSTRAINT [FK_SkinPackages_Packages]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DesktopModules_Packages]') AND parent_object_id = OBJECT_ID(N'[dbo].[DesktopModules]'))
ALTER TABLE [dbo].[DesktopModules]  WITH NOCHECK ADD  CONSTRAINT [FK_DesktopModules_Packages] FOREIGN KEY([PackageID])
REFERENCES [dbo].[Packages] ([PackageID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DesktopModules] CHECK CONSTRAINT [FK_DesktopModules_Packages]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Roles_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[Roles]'))
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Portals] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Roles_RoleGroups]') AND parent_object_id = OBJECT_ID(N'[dbo].[Roles]'))
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_RoleGroups] FOREIGN KEY([RoleGroupID])
REFERENCES [dbo].[RoleGroups] ([RoleGroupID])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_RoleGroups]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UrlLog_UrlTracking]') AND parent_object_id = OBJECT_ID(N'[dbo].[UrlLog]'))
ALTER TABLE [dbo].[UrlLog]  WITH CHECK ADD  CONSTRAINT [FK_UrlLog_UrlTracking] FOREIGN KEY([UrlTrackingID])
REFERENCES [dbo].[UrlTracking] ([UrlTrackingID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UrlLog] CHECK CONSTRAINT [FK_UrlLog_UrlTracking]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FolderMappingsSettings_FolderMappings]') AND parent_object_id = OBJECT_ID(N'[dbo].[FolderMappingsSettings]'))
ALTER TABLE [dbo].[FolderMappingsSettings]  WITH CHECK ADD  CONSTRAINT [FK_FolderMappingsSettings_FolderMappings] FOREIGN KEY([FolderMappingID])
REFERENCES [dbo].[FolderMappings] ([FolderMappingID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FolderMappingsSettings] CHECK CONSTRAINT [FK_FolderMappingsSettings_FolderMappings]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Packages_PackageTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Packages]'))
ALTER TABLE [dbo].[Packages]  WITH NOCHECK ADD  CONSTRAINT [FK_Packages_PackageTypes] FOREIGN KEY([PackageType])
REFERENCES [dbo].[PackageTypes] ([PackageType])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Packages] CHECK CONSTRAINT [FK_Packages_PackageTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRoles_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRoles]'))
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRoles_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRoles]'))
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventLogConfig_EventLogTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventLogConfig]'))
ALTER TABLE [dbo].[EventLogConfig]  WITH NOCHECK ADD  CONSTRAINT [FK_EventLogConfig_EventLogTypes] FOREIGN KEY([LogTypeKey])
REFERENCES [dbo].[EventLogTypes] ([LogTypeKey])
GO
ALTER TABLE [dbo].[EventLogConfig] CHECK CONSTRAINT [FK_EventLogConfig_EventLogTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventLog_EventLogConfig]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventLog]'))
ALTER TABLE [dbo].[EventLog]  WITH NOCHECK ADD  CONSTRAINT [FK_EventLog_EventLogConfig] FOREIGN KEY([LogConfigID])
REFERENCES [dbo].[EventLogConfig] ([ID])
GO
ALTER TABLE [dbo].[EventLog] CHECK CONSTRAINT [FK_EventLog_EventLogConfig]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EventLog_EventLogTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[EventLog]'))
ALTER TABLE [dbo].[EventLog]  WITH NOCHECK ADD  CONSTRAINT [FK_EventLog_EventLogTypes] FOREIGN KEY([LogTypeKey])
REFERENCES [dbo].[EventLogTypes] ([LogTypeKey])
GO
ALTER TABLE [dbo].[EventLog] CHECK CONSTRAINT [FK_EventLog_EventLogTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tabs_ContentItems]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tabs]'))
ALTER TABLE [dbo].[Tabs]  WITH CHECK ADD  CONSTRAINT [FK_Tabs_ContentItems] FOREIGN KEY([ContentItemID])
REFERENCES [dbo].[ContentItems] ([ContentItemID])
GO
ALTER TABLE [dbo].[Tabs] CHECK CONSTRAINT [FK_Tabs_ContentItems]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tabs_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tabs]'))
ALTER TABLE [dbo].[Tabs]  WITH NOCHECK ADD  CONSTRAINT [FK_Tabs_Portals] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tabs] CHECK CONSTRAINT [FK_Tabs_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tabs_Tabs]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tabs]'))
ALTER TABLE [dbo].[Tabs]  WITH NOCHECK ADD  CONSTRAINT [FK_Tabs_Tabs] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Tabs] ([TabID])
GO
ALTER TABLE [dbo].[Tabs] CHECK CONSTRAINT [FK_Tabs_Tabs]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Modules_ContentItems]') AND parent_object_id = OBJECT_ID(N'[dbo].[Modules]'))
ALTER TABLE [dbo].[Modules]  WITH CHECK ADD  CONSTRAINT [FK_Modules_ContentItems] FOREIGN KEY([ContentItemID])
REFERENCES [dbo].[ContentItems] ([ContentItemID])
GO
ALTER TABLE [dbo].[Modules] CHECK CONSTRAINT [FK_Modules_ContentItems]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Modules_ModuleDefinitions]') AND parent_object_id = OBJECT_ID(N'[dbo].[Modules]'))
ALTER TABLE [dbo].[Modules]  WITH CHECK ADD  CONSTRAINT [FK_Modules_ModuleDefinitions] FOREIGN KEY([ModuleDefID])
REFERENCES [dbo].[ModuleDefinitions] ([ModuleDefID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Modules] CHECK CONSTRAINT [FK_Modules_ModuleDefinitions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Modules_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[Modules]'))
ALTER TABLE [dbo].[Modules]  WITH NOCHECK ADD  CONSTRAINT [FK_Modules_Portals] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portals] ([PortalID])
GO
ALTER TABLE [dbo].[Modules] CHECK CONSTRAINT [FK_Modules_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VendorClassification_Classification]') AND parent_object_id = OBJECT_ID(N'[dbo].[VendorClassification]'))
ALTER TABLE [dbo].[VendorClassification]  WITH CHECK ADD  CONSTRAINT [FK_VendorClassification_Classification] FOREIGN KEY([ClassificationId])
REFERENCES [dbo].[Classification] ([ClassificationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VendorClassification] CHECK CONSTRAINT [FK_VendorClassification_Classification]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VendorClassification_Vendors]') AND parent_object_id = OBJECT_ID(N'[dbo].[VendorClassification]'))
ALTER TABLE [dbo].[VendorClassification]  WITH CHECK ADD  CONSTRAINT [FK_VendorClassification_Vendors] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendors] ([VendorId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VendorClassification] CHECK CONSTRAINT [FK_VendorClassification_Vendors]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CoreMessaging_Messages_CoreMessaging_NotificationTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[CoreMessaging_Messages]'))
ALTER TABLE [dbo].[CoreMessaging_Messages]  WITH CHECK ADD  CONSTRAINT [FK_CoreMessaging_Messages_CoreMessaging_NotificationTypes] FOREIGN KEY([NotificationTypeID])
REFERENCES [dbo].[CoreMessaging_NotificationTypes] ([NotificationTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CoreMessaging_Messages] CHECK CONSTRAINT [FK_CoreMessaging_Messages_CoreMessaging_NotificationTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CoreMessaging_NotificationTypeActions_CoreMessaging_NotificationTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[CoreMessaging_NotificationTypeActions]'))
ALTER TABLE [dbo].[CoreMessaging_NotificationTypeActions]  WITH CHECK ADD  CONSTRAINT [FK_CoreMessaging_NotificationTypeActions_CoreMessaging_NotificationTypes] FOREIGN KEY([NotificationTypeID])
REFERENCES [dbo].[CoreMessaging_NotificationTypes] ([NotificationTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CoreMessaging_NotificationTypeActions] CHECK CONSTRAINT [FK_CoreMessaging_NotificationTypeActions_CoreMessaging_NotificationTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ModuleSettings_Modules]') AND parent_object_id = OBJECT_ID(N'[dbo].[ModuleSettings]'))
ALTER TABLE [dbo].[ModuleSettings]  WITH CHECK ADD  CONSTRAINT [FK_ModuleSettings_Modules] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[Modules] ([ModuleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ModuleSettings] CHECK CONSTRAINT [FK_ModuleSettings_Modules]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SearchItem_Modules]') AND parent_object_id = OBJECT_ID(N'[dbo].[SearchItem]'))
ALTER TABLE [dbo].[SearchItem]  WITH CHECK ADD  CONSTRAINT [FK_SearchItem_Modules] FOREIGN KEY([ModuleId])
REFERENCES [dbo].[Modules] ([ModuleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SearchItem] CHECK CONSTRAINT [FK_SearchItem_Modules]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TabModules_Modules]') AND parent_object_id = OBJECT_ID(N'[dbo].[TabModules]'))
ALTER TABLE [dbo].[TabModules]  WITH NOCHECK ADD  CONSTRAINT [FK_TabModules_Modules] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[Modules] ([ModuleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TabModules] CHECK CONSTRAINT [FK_TabModules_Modules]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TabModules_Tabs]') AND parent_object_id = OBJECT_ID(N'[dbo].[TabModules]'))
ALTER TABLE [dbo].[TabModules]  WITH NOCHECK ADD  CONSTRAINT [FK_TabModules_Tabs] FOREIGN KEY([TabID])
REFERENCES [dbo].[Tabs] ([TabID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TabModules] CHECK CONSTRAINT [FK_TabModules_Tabs]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Links_Modules]') AND parent_object_id = OBJECT_ID(N'[dbo].[Links]'))
ALTER TABLE [dbo].[Links]  WITH CHECK ADD  CONSTRAINT [FK_Links_Modules] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[Modules] ([ModuleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Links] CHECK CONSTRAINT [FK_Links_Modules]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CoreMessaging_MessageAttachments_CoreMessaging_Messages]') AND parent_object_id = OBJECT_ID(N'[dbo].[CoreMessaging_MessageAttachments]'))
ALTER TABLE [dbo].[CoreMessaging_MessageAttachments]  WITH CHECK ADD  CONSTRAINT [FK_CoreMessaging_MessageAttachments_CoreMessaging_Messages] FOREIGN KEY([MessageID])
REFERENCES [dbo].[CoreMessaging_Messages] ([MessageID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CoreMessaging_MessageAttachments] CHECK CONSTRAINT [FK_CoreMessaging_MessageAttachments_CoreMessaging_Messages]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CoreMessaging_MessageRecipients_CoreMessaging_Messages]') AND parent_object_id = OBJECT_ID(N'[dbo].[CoreMessaging_MessageRecipients]'))
ALTER TABLE [dbo].[CoreMessaging_MessageRecipients]  WITH CHECK ADD  CONSTRAINT [FK_CoreMessaging_MessageRecipients_CoreMessaging_Messages] FOREIGN KEY([MessageID])
REFERENCES [dbo].[CoreMessaging_Messages] ([MessageID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CoreMessaging_MessageRecipients] CHECK CONSTRAINT [FK_CoreMessaging_MessageRecipients_CoreMessaging_Messages]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HtmlTextUsers_HtmlText]') AND parent_object_id = OBJECT_ID(N'[dbo].[HtmlTextUsers]'))
ALTER TABLE [dbo].[HtmlTextUsers]  WITH NOCHECK ADD  CONSTRAINT [FK_HtmlTextUsers_HtmlText] FOREIGN KEY([ItemID])
REFERENCES [dbo].[HtmlText] ([ItemID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HtmlTextUsers] CHECK CONSTRAINT [FK_HtmlTextUsers_HtmlText]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersOnline_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersOnline]'))
ALTER TABLE [dbo].[UsersOnline]  WITH CHECK ADD  CONSTRAINT [FK_UsersOnline_Portals] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersOnline] CHECK CONSTRAINT [FK_UsersOnline_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UsersOnline_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersOnline]'))
ALTER TABLE [dbo].[UsersOnline]  WITH CHECK ADD  CONSTRAINT [FK_UsersOnline_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersOnline] CHECK CONSTRAINT [FK_UsersOnline_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserAuthentication_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserAuthentication]'))
ALTER TABLE [dbo].[UserAuthentication]  WITH CHECK ADD  CONSTRAINT [FK_UserAuthentication_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserAuthentication] CHECK CONSTRAINT [FK_UserAuthentication_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserPortals_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserPortals]'))
ALTER TABLE [dbo].[UserPortals]  WITH CHECK ADD  CONSTRAINT [FK_UserPortals_Portals] FOREIGN KEY([PortalId])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserPortals] CHECK CONSTRAINT [FK_UserPortals_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserPortals_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserPortals]'))
ALTER TABLE [dbo].[UserPortals]  WITH CHECK ADD  CONSTRAINT [FK_UserPortals_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserPortals] CHECK CONSTRAINT [FK_UserPortals_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Profile_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[Profile]'))
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Portals] FOREIGN KEY([PortalId])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Profile_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Profile]'))
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ModuleDefinitions_DesktopModules]') AND parent_object_id = OBJECT_ID(N'[dbo].[ModuleDefinitions]'))
ALTER TABLE [dbo].[ModuleDefinitions]  WITH NOCHECK ADD  CONSTRAINT [FK_ModuleDefinitions_DesktopModules] FOREIGN KEY([DesktopModuleID])
REFERENCES [dbo].[DesktopModules] ([DesktopModuleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ModuleDefinitions] CHECK CONSTRAINT [FK_ModuleDefinitions_DesktopModules]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CoreMessaging_NotificationTypes_DesktopModules]') AND parent_object_id = OBJECT_ID(N'[dbo].[CoreMessaging_NotificationTypes]'))
ALTER TABLE [dbo].[CoreMessaging_NotificationTypes]  WITH CHECK ADD  CONSTRAINT [FK_CoreMessaging_NotificationTypes_DesktopModules] FOREIGN KEY([DesktopModuleID])
REFERENCES [dbo].[DesktopModules] ([DesktopModuleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CoreMessaging_NotificationTypes] CHECK CONSTRAINT [FK_CoreMessaging_NotificationTypes_DesktopModules]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PortalDesktopModules_DesktopModules]') AND parent_object_id = OBJECT_ID(N'[dbo].[PortalDesktopModules]'))
ALTER TABLE [dbo].[PortalDesktopModules]  WITH CHECK ADD  CONSTRAINT [FK_PortalDesktopModules_DesktopModules] FOREIGN KEY([DesktopModuleID])
REFERENCES [dbo].[DesktopModules] ([DesktopModuleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PortalDesktopModules] CHECK CONSTRAINT [FK_PortalDesktopModules_DesktopModules]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PortalDesktopModules_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[PortalDesktopModules]'))
ALTER TABLE [dbo].[PortalDesktopModules]  WITH CHECK ADD  CONSTRAINT [FK_PortalDesktopModules_Portals] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PortalDesktopModules] CHECK CONSTRAINT [FK_PortalDesktopModules_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Mobile_RedirectionRules_Mobile_Redirections]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mobile_RedirectionRules]'))
ALTER TABLE [dbo].[Mobile_RedirectionRules]  WITH CHECK ADD  CONSTRAINT [FK_Mobile_RedirectionRules_Mobile_Redirections] FOREIGN KEY([RedirectionId])
REFERENCES [dbo].[Mobile_Redirections] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Mobile_RedirectionRules] CHECK CONSTRAINT [FK_Mobile_RedirectionRules_Mobile_Redirections]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Banner_Vendor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Banners]'))
ALTER TABLE [dbo].[Banners]  WITH CHECK ADD  CONSTRAINT [FK_Banner_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendors] ([VendorId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Banners] CHECK CONSTRAINT [FK_Banner_Vendor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Affiliates_Vendors]') AND parent_object_id = OBJECT_ID(N'[dbo].[Affiliates]'))
ALTER TABLE [dbo].[Affiliates]  WITH CHECK ADD  CONSTRAINT [FK_Affiliates_Vendors] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendors] ([VendorId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Affiliates] CHECK CONSTRAINT [FK_Affiliates_Vendors]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Taxonomy_Terms_Taxonomy_Terms]') AND parent_object_id = OBJECT_ID(N'[dbo].[Taxonomy_Terms]'))
ALTER TABLE [dbo].[Taxonomy_Terms]  WITH CHECK ADD  CONSTRAINT [FK_Taxonomy_Terms_Taxonomy_Terms] FOREIGN KEY([ParentTermID])
REFERENCES [dbo].[Taxonomy_Terms] ([TermID])
GO
ALTER TABLE [dbo].[Taxonomy_Terms] CHECK CONSTRAINT [FK_Taxonomy_Terms_Taxonomy_Terms]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Taxonomy_Terms_Taxonomy_Vocabularies]') AND parent_object_id = OBJECT_ID(N'[dbo].[Taxonomy_Terms]'))
ALTER TABLE [dbo].[Taxonomy_Terms]  WITH CHECK ADD  CONSTRAINT [FK_Taxonomy_Terms_Taxonomy_Vocabularies] FOREIGN KEY([VocabularyID])
REFERENCES [dbo].[Taxonomy_Vocabularies] ([VocabularyID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Taxonomy_Terms] CHECK CONSTRAINT [FK_Taxonomy_Terms_Taxonomy_Vocabularies]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContentItems_ContentTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContentItems]'))
ALTER TABLE [dbo].[ContentItems]  WITH CHECK ADD  CONSTRAINT [FK_ContentItems_ContentTypes] FOREIGN KEY([ContentTypeID])
REFERENCES [dbo].[ContentTypes] ([ContentTypeID])
GO
ALTER TABLE [dbo].[ContentItems] CHECK CONSTRAINT [FK_ContentItems_ContentTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TabSettings_Tabs]') AND parent_object_id = OBJECT_ID(N'[dbo].[TabSettings]'))
ALTER TABLE [dbo].[TabSettings]  WITH CHECK ADD  CONSTRAINT [FK_TabSettings_Tabs] FOREIGN KEY([TabID])
REFERENCES [dbo].[Tabs] ([TabID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TabSettings] CHECK CONSTRAINT [FK_TabSettings_Tabs]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ModuleControls_ModuleDefinitions]') AND parent_object_id = OBJECT_ID(N'[dbo].[ModuleControls]'))
ALTER TABLE [dbo].[ModuleControls]  WITH CHECK ADD  CONSTRAINT [FK_ModuleControls_ModuleDefinitions] FOREIGN KEY([ModuleDefID])
REFERENCES [dbo].[ModuleDefinitions] ([ModuleDefID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ModuleControls] CHECK CONSTRAINT [FK_ModuleControls_ModuleDefinitions]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PortalAlias_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[PortalAlias]'))
ALTER TABLE [dbo].[PortalAlias]  WITH CHECK ADD  CONSTRAINT [FK_PortalAlias_Portals] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PortalAlias] CHECK CONSTRAINT [FK_PortalAlias_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SiteLog_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[SiteLog]'))
ALTER TABLE [dbo].[SiteLog]  WITH CHECK ADD  CONSTRAINT [FK_SiteLog_Portals] FOREIGN KEY([PortalId])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SiteLog] CHECK CONSTRAINT [FK_SiteLog_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Mobile_PreviewProfiles_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mobile_PreviewProfiles]'))
ALTER TABLE [dbo].[Mobile_PreviewProfiles]  WITH CHECK ADD  CONSTRAINT [FK_Mobile_PreviewProfiles_Portals] FOREIGN KEY([PortalId])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Mobile_PreviewProfiles] CHECK CONSTRAINT [FK_Mobile_PreviewProfiles_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Mobile_Redirections_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mobile_Redirections]'))
ALTER TABLE [dbo].[Mobile_Redirections]  WITH CHECK ADD  CONSTRAINT [FK_Mobile_Redirections_Portals] FOREIGN KEY([PortalId])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Mobile_Redirections] CHECK CONSTRAINT [FK_Mobile_Redirections_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vendor_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vendors]'))
ALTER TABLE [dbo].[Vendors]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Portals] FOREIGN KEY([PortalId])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Vendors] CHECK CONSTRAINT [FK_Vendor_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AnonymousUsers_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[AnonymousUsers]'))
ALTER TABLE [dbo].[AnonymousUsers]  WITH CHECK ADD  CONSTRAINT [FK_AnonymousUsers_Portals] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AnonymousUsers] CHECK CONSTRAINT [FK_AnonymousUsers_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SystemMessages_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[SystemMessages]'))
ALTER TABLE [dbo].[SystemMessages]  WITH CHECK ADD  CONSTRAINT [FK_SystemMessages_Portals] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SystemMessages] CHECK CONSTRAINT [FK_SystemMessages_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProfilePropertyDefinition_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProfilePropertyDefinition]'))
ALTER TABLE [dbo].[ProfilePropertyDefinition]  WITH NOCHECK ADD  CONSTRAINT [FK_ProfilePropertyDefinition_Portals] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProfilePropertyDefinition] CHECK CONSTRAINT [FK_ProfilePropertyDefinition_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Folders_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[Folders]'))
ALTER TABLE [dbo].[Folders]  WITH CHECK ADD  CONSTRAINT [FK_Folders_Portals] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Folders] CHECK CONSTRAINT [FK_Folders_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PortalLocalization_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[PortalLocalization]'))
ALTER TABLE [dbo].[PortalLocalization]  WITH CHECK ADD  CONSTRAINT [FK_PortalLocalization_Portals] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PortalLocalization] CHECK CONSTRAINT [FK_PortalLocalization_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PortalSettings_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[PortalSettings]'))
ALTER TABLE [dbo].[PortalSettings]  WITH CHECK ADD  CONSTRAINT [FK_PortalSettings_Portals] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PortalSettings] CHECK CONSTRAINT [FK_PortalSettings_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RoleGroups_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[RoleGroups]'))
ALTER TABLE [dbo].[RoleGroups]  WITH CHECK ADD  CONSTRAINT [FK_RoleGroups_Portals] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleGroups] CHECK CONSTRAINT [FK_RoleGroups_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UrlTracking_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[UrlTracking]'))
ALTER TABLE [dbo].[UrlTracking]  WITH CHECK ADD  CONSTRAINT [FK_UrlTracking_Portals] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UrlTracking] CHECK CONSTRAINT [FK_UrlTracking_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FolderMappings_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[FolderMappings]'))
ALTER TABLE [dbo].[FolderMappings]  WITH CHECK ADD  CONSTRAINT [FK_FolderMappings_Portals] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FolderMappings] CHECK CONSTRAINT [FK_FolderMappings_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Urls_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[Urls]'))
ALTER TABLE [dbo].[Urls]  WITH CHECK ADD  CONSTRAINT [FK_Urls_Portals] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Urls] CHECK CONSTRAINT [FK_Urls_Portals]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Journal_Data_Journal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Journal_Data]'))
ALTER TABLE [dbo].[Journal_Data]  WITH NOCHECK ADD  CONSTRAINT [FK_Journal_Data_Journal] FOREIGN KEY([JournalId])
REFERENCES [dbo].[Journal] ([JournalId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Journal_Data] NOCHECK CONSTRAINT [FK_Journal_Data_Journal]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_JournalComments_Journal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Journal_Comments]'))
ALTER TABLE [dbo].[Journal_Comments]  WITH NOCHECK ADD  CONSTRAINT [FK_JournalComments_Journal] FOREIGN KEY([JournalId])
REFERENCES [dbo].[Journal] ([JournalId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Journal_Comments] NOCHECK CONSTRAINT [FK_JournalComments_Journal]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Journal_JournalTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Journal]'))
ALTER TABLE [dbo].[Journal]  WITH NOCHECK ADD  CONSTRAINT [FK_Journal_JournalTypes] FOREIGN KEY([JournalTypeId])
REFERENCES [dbo].[Journal_Types] ([JournalTypeId])
GO
ALTER TABLE [dbo].[Journal] NOCHECK CONSTRAINT [FK_Journal_JournalTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Skins_SkinPackages]') AND parent_object_id = OBJECT_ID(N'[dbo].[Skins]'))
ALTER TABLE [dbo].[Skins]  WITH NOCHECK ADD  CONSTRAINT [FK_Skins_SkinPackages] FOREIGN KEY([SkinPackageID])
REFERENCES [dbo].[SkinPackages] ([SkinPackageID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Skins] CHECK CONSTRAINT [FK_Skins_SkinPackages]
