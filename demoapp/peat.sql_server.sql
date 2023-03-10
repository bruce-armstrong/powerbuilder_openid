USE [master]
GO
/****** Object:  Database [PEAT]    Script Date: 3/4/2021 4:55:37 PM ******/
CREATE DATABASE [PEAT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PEAT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PEAT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PEAT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PEAT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PEAT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PEAT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PEAT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PEAT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PEAT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PEAT] SET ARITHABORT OFF 
GO
ALTER DATABASE [PEAT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PEAT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PEAT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PEAT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PEAT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PEAT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PEAT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PEAT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PEAT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PEAT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PEAT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PEAT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PEAT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PEAT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PEAT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PEAT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PEAT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PEAT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PEAT] SET  MULTI_USER 
GO
ALTER DATABASE [PEAT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PEAT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PEAT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PEAT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PEAT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PEAT] SET QUERY_STORE = OFF
GO
USE [PEAT]
GO
/****** Object:  User [dba]    Script Date: 3/4/2021 4:55:37 PM ******/
CREATE USER [dba] FOR LOGIN [dba] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [dba]
GO
/****** Object:  Table [dbo].[messages]    Script Date: 3/4/2021 4:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[messages](
	[msgid] [varchar](40) NOT NULL,
	[msgtitle] [varchar](255) NOT NULL,
	[msgtext] [varchar](255) NOT NULL,
	[msgicon] [varchar](12) NOT NULL,
	[msgbutton] [varchar](17) NOT NULL,
	[msgdefaultbutton] [int] NOT NULL,
	[msgseverity] [int] NOT NULL,
	[msgprint] [varchar](1) NOT NULL,
	[msguserinput] [varchar](1) NOT NULL,
 CONSTRAINT [PK_messages] PRIMARY KEY CLUSTERED 
(
	[msgid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pbcatcol]    Script Date: 3/4/2021 4:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pbcatcol](
	[pbc_tnam] [varchar](128) NOT NULL,
	[pbc_tid] [int] NULL,
	[pbc_ownr] [varchar](128) NOT NULL,
	[pbc_cnam] [varchar](128) NOT NULL,
	[pbc_cid] [smallint] NULL,
	[pbc_labl] [varchar](254) NULL,
	[pbc_lpos] [smallint] NULL,
	[pbc_hdr] [varchar](254) NULL,
	[pbc_hpos] [smallint] NULL,
	[pbc_jtfy] [smallint] NULL,
	[pbc_mask] [varchar](31) NULL,
	[pbc_case] [smallint] NULL,
	[pbc_hght] [smallint] NULL,
	[pbc_wdth] [smallint] NULL,
	[pbc_ptrn] [varchar](31) NULL,
	[pbc_bmap] [varchar](1) NULL,
	[pbc_init] [varchar](254) NULL,
	[pbc_cmnt] [varchar](254) NULL,
	[pbc_edit] [varchar](31) NULL,
	[pbc_tag] [varchar](254) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pbcatedt]    Script Date: 3/4/2021 4:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pbcatedt](
	[pbe_name] [varchar](30) NOT NULL,
	[pbe_edit] [varchar](254) NULL,
	[pbe_type] [smallint] NULL,
	[pbe_cntr] [int] NULL,
	[pbe_seqn] [smallint] NOT NULL,
	[pbe_flag] [int] NULL,
	[pbe_work] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pbcatfmt]    Script Date: 3/4/2021 4:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pbcatfmt](
	[pbf_name] [varchar](30) NOT NULL,
	[pbf_frmt] [varchar](254) NULL,
	[pbf_type] [smallint] NULL,
	[pbf_cntr] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pbcattbl]    Script Date: 3/4/2021 4:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pbcattbl](
	[pbt_tnam] [varchar](128) NOT NULL,
	[pbt_tid] [int] NULL,
	[pbt_ownr] [varchar](128) NOT NULL,
	[pbd_fhgt] [smallint] NULL,
	[pbd_fwgt] [smallint] NULL,
	[pbd_fitl] [varchar](1) NULL,
	[pbd_funl] [varchar](1) NULL,
	[pbd_fchr] [smallint] NULL,
	[pbd_fptc] [smallint] NULL,
	[pbd_ffce] [varchar](18) NULL,
	[pbh_fhgt] [smallint] NULL,
	[pbh_fwgt] [smallint] NULL,
	[pbh_fitl] [varchar](1) NULL,
	[pbh_funl] [varchar](1) NULL,
	[pbh_fchr] [smallint] NULL,
	[pbh_fptc] [smallint] NULL,
	[pbh_ffce] [varchar](18) NULL,
	[pbl_fhgt] [smallint] NULL,
	[pbl_fwgt] [smallint] NULL,
	[pbl_fitl] [varchar](1) NULL,
	[pbl_funl] [varchar](1) NULL,
	[pbl_fchr] [smallint] NULL,
	[pbl_fptc] [smallint] NULL,
	[pbl_ffce] [varchar](18) NULL,
	[pbt_cmnt] [varchar](254) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pbcatvld]    Script Date: 3/4/2021 4:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pbcatvld](
	[pbv_name] [varchar](30) NOT NULL,
	[pbv_vald] [varchar](254) NULL,
	[pbv_type] [smallint] NULL,
	[pbv_cntr] [int] NULL,
	[pbv_msg] [varchar](254) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project]    Script Date: 3/4/2021 4:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project](
	[PROJECT_ID] [int] NOT NULL,
	[NAME] [varchar](50) NULL,
	[PROJECT_LEADER] [varchar](50) NULL,
	[START_DATE] [date] NULL,
	[END_DATE] [date] NULL,
 CONSTRAINT [PK_project] PRIMARY KEY CLUSTERED 
(
	[PROJECT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project_category]    Script Date: 3/4/2021 4:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_category](
	[category_id] [int] NOT NULL,
	[project_id] [int] NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_project_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC,
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project_category_item]    Script Date: 3/4/2021 4:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_category_item](
	[CATEGORY_ITEM_ID] [int] NOT NULL,
	[PROJECT_ID] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[COMPLEXITY_ID] [int] NOT NULL,
	[ROLE_ID] [int] NULL,
	[NAME] [varchar](50) NULL,
	[estimated_hours] [numeric](8, 2) NULL,
	[ACTUAL_HOURS] [numeric](8, 2) NULL,
 CONSTRAINT [PK_project_category_item] PRIMARY KEY CLUSTERED 
(
	[CATEGORY_ITEM_ID] ASC,
	[PROJECT_ID] ASC,
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project_complexity]    Script Date: 3/4/2021 4:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_complexity](
	[complexity_id] [int] NOT NULL,
	[project_id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[estimated_hours] [numeric](8, 2) NULL,
 CONSTRAINT [PK_project_complexity] PRIMARY KEY CLUSTERED 
(
	[complexity_id] ASC,
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project_derived_item]    Script Date: 3/4/2021 4:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_derived_item](
	[derived_item_id] [int] NOT NULL,
	[project_id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[percentage] [numeric](5, 2) NULL,
	[rate] [numeric](8, 2) NULL,
	[actual_hours] [numeric](8, 2) NULL,
 CONSTRAINT [PK_project_derived_item] PRIMARY KEY CLUSTERED 
(
	[derived_item_id] ASC,
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project_role]    Script Date: 3/4/2021 4:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_role](
	[role_id] [int] NOT NULL,
	[project_id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[rate] [numeric](8, 2) NULL,
	[multipler] [numeric](5, 2) NULL,
 CONSTRAINT [PK_project_role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC,
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[messages] ([msgid], [msgtitle], [msgtext], [msgicon], [msgbutton], [msgdefaultbutton], [msgseverity], [msgprint], [msguserinput]) VALUES (N'pfc_closequery_failsvalidation', N'Application', N'The information entered does not pass validation and must be corrected before changes can be saved.~r~n~r~nClose without saving changes?', N'Exclamation', N'YesNo', 2, 5, N'N', N'N')
INSERT [dbo].[messages] ([msgid], [msgtitle], [msgtext], [msgicon], [msgbutton], [msgdefaultbutton], [msgseverity], [msgprint], [msguserinput]) VALUES (N'pfc_closequery_savechanges', N'Application', N'Do you want to save changes?', N'Exclamation', N'YesNoCancel', 1, 0, N'N', N'N')
INSERT [dbo].[messages] ([msgid], [msgtitle], [msgtext], [msgicon], [msgbutton], [msgdefaultbutton], [msgseverity], [msgprint], [msguserinput]) VALUES (N'pfc_dwdberror', N'Application', N'%s', N'StopSign', N'Ok', 1, 20, N'N', N'N')
INSERT [dbo].[messages] ([msgid], [msgtitle], [msgtext], [msgicon], [msgbutton], [msgdefaultbutton], [msgseverity], [msgprint], [msguserinput]) VALUES (N'pfc_requiredmissing', N'Application', N'Required value missing for %s on row %s.  Please enter a value.', N'Information', N'Ok', 1, 5, N'N', N'N')
INSERT [dbo].[messages] ([msgid], [msgtitle], [msgtext], [msgicon], [msgbutton], [msgdefaultbutton], [msgseverity], [msgprint], [msguserinput]) VALUES (N'pfc_systemerror', N'System Error', N'%s', N'StopSign', N'Ok', 1, 20, N'N', N'N')
GO
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'###,###.00', N'###,###.00', 90, 1, 1, 32, N'10')
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'#####', N'#####', 90, 1, 1, 32, N'10')
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'###-##-####', N'###-##-####', 90, 1, 1, 32, N'00')
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'MM/DD/YY', N'MM/DD/YY', 90, 1, 1, 32, N'20')
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'DD/MM/YY', N'DD/MM/YY', 90, 1, 1, 32, N'20')
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'MM/DD/YYYY', N'MM/DD/YYYY', 90, 1, 1, 32, N'20')
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'DD/MM/YYYY', N'DD/MM/YYYY', 90, 1, 1, 32, N'20')
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'DD/MMM/YY', N'DD/MMM/YY', 90, 1, 1, 32, N'20')
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'JJJ/YY', N'JJJ/YY', 90, 1, 1, 32, N'20')
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'JJJ/YYYY', N'JJJ/YYYY', 90, 1, 1, 32, N'20')
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'HH:MM:SS', N'HH:MM:SS', 90, 1, 1, 32, N'30')
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'HH:MM:SS:FFF', N'HH:MM:SS:FFF', 90, 1, 1, 32, N'30')
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'HH:MM:SS:FFFFFF', N'HH:MM:SS:FFFFFF', 90, 1, 1, 32, N'30')
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'MM/DD/YY HH:MM:SS', N'MM/DD/YY HH:MM:SS', 90, 1, 1, 32, N'40')
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'DD/MM/YY HH:MM:SS', N'DD/MM/YY HH:MM:SS', 90, 1, 1, 32, N'40')
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'MM/DD/YYYY HH:MM:SS', N'MM/DD/YYYY HH:MM:SS', 90, 1, 1, 32, N'40')
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'DD/MM/YYYY HH:MM:SS', N'DD/MM/YYYY HH:MM:SS', 90, 1, 1, 32, N'40')
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'DD/MMM/YY HH:MM:SS', N'DD/MMM/YY HH:MM:SS', 90, 1, 1, 32, N'40')
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'JJJ/YY HH:MM:SS', N'JJJ/YY HH:MM:SS', 90, 1, 1, 32, N'40')
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'JJJ/YYYY HH:MM:SS', N'JJJ/YYYY HH:MM:SS', 90, 1, 1, 32, N'40')
INSERT [dbo].[pbcatedt] ([pbe_name], [pbe_edit], [pbe_type], [pbe_cntr], [pbe_seqn], [pbe_flag], [pbe_work]) VALUES (N'DD/MM/YY HH:MM:SS:FFFFFF', N'DD/MM/YY HH:MM:SS:FFFFFF', 90, 1, 1, 32, N'40')
GO
INSERT [dbo].[pbcatfmt] ([pbf_name], [pbf_frmt], [pbf_type], [pbf_cntr]) VALUES (N'[General]', N'[General]', 81, 0)
INSERT [dbo].[pbcatfmt] ([pbf_name], [pbf_frmt], [pbf_type], [pbf_cntr]) VALUES (N'0', N'0', 81, 0)
INSERT [dbo].[pbcatfmt] ([pbf_name], [pbf_frmt], [pbf_type], [pbf_cntr]) VALUES (N'0.00', N'0.00', 81, 0)
INSERT [dbo].[pbcatfmt] ([pbf_name], [pbf_frmt], [pbf_type], [pbf_cntr]) VALUES (N'#,##0', N'#,##0', 81, 0)
INSERT [dbo].[pbcatfmt] ([pbf_name], [pbf_frmt], [pbf_type], [pbf_cntr]) VALUES (N'#,##0.00', N'#,##0.00', 81, 0)
INSERT [dbo].[pbcatfmt] ([pbf_name], [pbf_frmt], [pbf_type], [pbf_cntr]) VALUES (N'$#,##0;($#,##0)', N'$#,##0;($#,##0)', 81, 0)
INSERT [dbo].[pbcatfmt] ([pbf_name], [pbf_frmt], [pbf_type], [pbf_cntr]) VALUES (N'$#,##0;[RED]($#,##0)', N'$#,##0;[RED]($#,##0)', 81, 0)
INSERT [dbo].[pbcatfmt] ([pbf_name], [pbf_frmt], [pbf_type], [pbf_cntr]) VALUES (N'$#,##0.00;($#,##0.00)', N'$#,##0.00;($#,##0.00)', 81, 0)
INSERT [dbo].[pbcatfmt] ([pbf_name], [pbf_frmt], [pbf_type], [pbf_cntr]) VALUES (N'$#,##0.00;[RED]($#,##0.00)', N'$#,##0.00;[RED]($#,##0.00)', 81, 0)
INSERT [dbo].[pbcatfmt] ([pbf_name], [pbf_frmt], [pbf_type], [pbf_cntr]) VALUES (N'0%', N'0%', 81, 0)
INSERT [dbo].[pbcatfmt] ([pbf_name], [pbf_frmt], [pbf_type], [pbf_cntr]) VALUES (N'0.00%', N'0.00%', 81, 0)
INSERT [dbo].[pbcatfmt] ([pbf_name], [pbf_frmt], [pbf_type], [pbf_cntr]) VALUES (N'0.00E+00', N'0.00E+00', 81, 0)
INSERT [dbo].[pbcatfmt] ([pbf_name], [pbf_frmt], [pbf_type], [pbf_cntr]) VALUES (N'm/d/yy', N'm/d/yy', 84, 0)
INSERT [dbo].[pbcatfmt] ([pbf_name], [pbf_frmt], [pbf_type], [pbf_cntr]) VALUES (N'd-mmm-yy', N'd-mmm-yy', 84, 0)
INSERT [dbo].[pbcatfmt] ([pbf_name], [pbf_frmt], [pbf_type], [pbf_cntr]) VALUES (N'd-mmm', N'd-mmm', 84, 0)
INSERT [dbo].[pbcatfmt] ([pbf_name], [pbf_frmt], [pbf_type], [pbf_cntr]) VALUES (N'mmm-yy', N'mmm-yy', 84, 0)
INSERT [dbo].[pbcatfmt] ([pbf_name], [pbf_frmt], [pbf_type], [pbf_cntr]) VALUES (N'h:mm AM/PM', N'h:mm AM/PM', 84, 0)
INSERT [dbo].[pbcatfmt] ([pbf_name], [pbf_frmt], [pbf_type], [pbf_cntr]) VALUES (N'h:mm:ss AM/PM', N'h:mm:ss AM/PM', 84, 0)
INSERT [dbo].[pbcatfmt] ([pbf_name], [pbf_frmt], [pbf_type], [pbf_cntr]) VALUES (N'h:mm:ss', N'h:mm:ss', 84, 0)
INSERT [dbo].[pbcatfmt] ([pbf_name], [pbf_frmt], [pbf_type], [pbf_cntr]) VALUES (N'm/d/yy h:mm', N'm/d/yy h:mm', 84, 0)
GO
INSERT [dbo].[project] ([PROJECT_ID], [NAME], [PROJECT_LEADER], [START_DATE], [END_DATE]) VALUES (1, N'Project Estimate and Actual Tracking System', N'Kelli Roddy', CAST(N'1996-03-11' AS Date), CAST(N'1996-04-30' AS Date))
INSERT [dbo].[project] ([PROJECT_ID], [NAME], [PROJECT_LEADER], [START_DATE], [END_DATE]) VALUES (2, N'Event Planning System', N'Linda Mahoney', CAST(N'1996-02-07' AS Date), CAST(N'1996-07-17' AS Date))
INSERT [dbo].[project] ([PROJECT_ID], [NAME], [PROJECT_LEADER], [START_DATE], [END_DATE]) VALUES (3, N'Library Maintenance System', N'Jill Ortberg', CAST(N'1996-03-05' AS Date), CAST(N'1996-07-10' AS Date))
INSERT [dbo].[project] ([PROJECT_ID], [NAME], [PROJECT_LEADER], [START_DATE], [END_DATE]) VALUES (4, N'Address Book System', N'Kimm Seebeck', CAST(N'1996-05-01' AS Date), CAST(N'1996-12-31' AS Date))
INSERT [dbo].[project] ([PROJECT_ID], [NAME], [PROJECT_LEADER], [START_DATE], [END_DATE]) VALUES (5, N'Call Tracking System', N'Chuck Miller', CAST(N'1996-06-10' AS Date), CAST(N'2030-11-01' AS Date))
INSERT [dbo].[project] ([PROJECT_ID], [NAME], [PROJECT_LEADER], [START_DATE], [END_DATE]) VALUES (6, N'Customer Service System', N'Newman Peterson', CAST(N'1995-01-01' AS Date), CAST(N'1997-12-31' AS Date))
INSERT [dbo].[project] ([PROJECT_ID], [NAME], [PROJECT_LEADER], [START_DATE], [END_DATE]) VALUES (7, N'Message Maintenance System', N'Kendall Miller', CAST(N'1997-01-01' AS Date), CAST(N'1997-12-31' AS Date))
GO
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (1, 1, N'Windows')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (2, 1, N'Database')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (3, 1, N'UserObject')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (4, 1, N'Report')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (5, 1, N'Menu')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (6, 1, N'Documentation')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (7, 2, N'Database')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (8, 2, N'Menu')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (9, 2, N'DataStore')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (10, 2, N'Window')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (11, 2, N'Installation/Delivery')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (12, 2, N'UserObject')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (13, 2, N'Report')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (14, 2, N'Documentation')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (15, 2, N'Framework')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (16, 3, N'Database')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (17, 3, N'Window')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (18, 3, N'Documentation')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (19, 3, N'Framework')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (20, 4, N'UserObject')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (21, 4, N'Report')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (22, 4, N'Installation/Delivery')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (23, 4, N'Documentation')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (24, 4, N'Database')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (25, 4, N'Framework')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (26, 4, N'Menu')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (27, 4, N'Windows')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (28, 5, N'Window')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (29, 5, N'Menu')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (30, 5, N'Database')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (31, 5, N'Report')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (32, 6, N'Window')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (33, 6, N'Menu')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (34, 6, N'UserObject')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (35, 6, N'Framework')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (36, 6, N'DataWindow')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (37, 6, N'Database')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (38, 6, N'Documentation')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (39, 6, N'Delivery')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (40, 6, N'Analysis')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (41, 6, N'Design')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (42, 7, N'Database')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (43, 7, N'Window')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (44, 7, N'Report')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (45, 7, N'Documentation')
INSERT [dbo].[project_category] ([category_id], [project_id], [name]) VALUES (47, 7, N'Menu')
GO
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (1, 7, 42, 27, 26, N'Triggers and stored procedures', CAST(16.00 AS Numeric(8, 2)), CAST(16.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (2, 7, 42, 27, 26, N'Design and construction', CAST(12.00 AS Numeric(8, 2)), CAST(18.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (3, 7, 42, 25, 26, N'Table maintenance', CAST(8.00 AS Numeric(8, 2)), CAST(4.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (4, 7, 42, 25, 26, N'Extended attributes', CAST(4.00 AS Numeric(8, 2)), CAST(5.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (5, 7, 45, 27, 27, N'User Manual', CAST(28.00 AS Numeric(8, 2)), CAST(32.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (6, 7, 43, 25, 26, N'Frame', CAST(8.00 AS Numeric(8, 2)), CAST(16.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (7, 7, 43, 26, 27, N'Call window', CAST(32.00 AS Numeric(8, 2)), CAST(47.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (8, 7, 47, 27, 28, N'Sheet menu', CAST(16.00 AS Numeric(8, 2)), CAST(8.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (9, 7, 47, 25, 28, N'Frame menu', CAST(4.00 AS Numeric(8, 2)), CAST(4.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (10, 7, 44, 26, 25, N'Call Report', CAST(45.00 AS Numeric(8, 2)), CAST(56.50 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (11, 1, 2, 4, 3, N'Extended Attributes', CAST(12.00 AS Numeric(8, 2)), CAST(8.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (12, 6, 40, 24, 23, N'Object Model', CAST(132.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (13, 6, 37, 23, 22, N'Data Model', CAST(85.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (14, 5, 29, 20, 19, N'Master menu', CAST(12.00 AS Numeric(8, 2)), CAST(15.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (15, 5, 29, 18, 21, N'Sheet menu', CAST(4.00 AS Numeric(8, 2)), CAST(3.50 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (16, 5, 30, 20, 20, N'Database creation', CAST(12.00 AS Numeric(8, 2)), CAST(10.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (17, 5, 30, 21, 20, N'Triggers and stored procedures', CAST(24.00 AS Numeric(8, 2)), CAST(18.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (20, 5, 31, 22, 19, N'Call tracking report', CAST(55.00 AS Numeric(8, 2)), CAST(62.50 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (21, 5, 28, 18, 21, N'Frame window', CAST(4.00 AS Numeric(8, 2)), CAST(3.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (22, 5, 28, 20, 21, N'Sheet window', CAST(16.00 AS Numeric(8, 2)), CAST(15.75 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (23, 5, 28, 19, 21, N'Open dialog', CAST(9.00 AS Numeric(8, 2)), CAST(9.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (24, 5, 28, 20, 21, N'Maintenance window', CAST(9.00 AS Numeric(8, 2)), CAST(7.50 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (25, 5, 28, 19, 19, N'Report window', CAST(12.00 AS Numeric(8, 2)), CAST(12.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (26, 4, 24, 17, 15, N'Physical database', CAST(12.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (27, 4, 25, 31, 18, N'Create problem domain ancestor', CAST(37.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (28, 4, 24, 17, 15, N'Triggers and stored procedures', CAST(16.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (29, 4, 24, 17, 15, N'Database design', CAST(20.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (30, 4, 23, 14, 16, N'On-line help', CAST(40.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (31, 4, 27, 13, 17, N'Frame window', CAST(8.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (32, 4, 27, 15, 17, N'Address book sheet', CAST(36.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (33, 4, 27, 14, 18, N'Information dialog', CAST(18.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (34, 4, 21, 14, 16, N'Address lables', CAST(14.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (35, 4, 21, 15, 15, N'Phone report', CAST(30.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (36, 4, 21, 15, 18, N'Phone book report', CAST(30.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (37, 4, 22, 31, 16, N'Deliver system', CAST(8.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (38, 4, 26, 14, 17, N'Main menu', CAST(14.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (39, 4, 26, 13, 17, N'Frame menu', CAST(4.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (40, 4, 20, 14, 17, N'Information tab', CAST(32.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (41, 3, 17, 9, 13, N'Frame window', CAST(8.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (42, 3, 18, 11, 12, N'On-line help', CAST(32.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (43, 3, 18, 11, 12, N'Training manual', CAST(24.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (44, 3, 16, 10, 11, N'Extended attributes', CAST(12.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (45, 3, 16, 11, 11, N'Triggers and stored procedures', CAST(24.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (46, 3, 16, 11, 11, N'Physical data modeling', CAST(18.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (47, 3, 16, 11, 11, N'Logical data modeling', CAST(24.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (48, 3, 19, 12, 10, N'Problem domain ancestor', CAST(36.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (49, 2, 10, 7, 8, N'Event definition sheet', CAST(12.00 AS Numeric(8, 2)), CAST(15.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (50, 2, 10, 7, 8, N'Participant maintenance', CAST(16.00 AS Numeric(8, 2)), CAST(12.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (51, 2, 10, 8, 8, N'Schedule event sheet', CAST(28.00 AS Numeric(8, 2)), CAST(25.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (52, 2, 10, 6, 9, N'Address maintenance', CAST(4.00 AS Numeric(8, 2)), CAST(4.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (53, 2, 10, 6, 9, N'Location maintenance', CAST(4.00 AS Numeric(8, 2)), CAST(3.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (54, 2, 10, 6, 9, N'Follow-up maintenance', CAST(4.00 AS Numeric(8, 2)), CAST(6.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (55, 2, 10, 6, 9, N'Prize maintenance', CAST(4.00 AS Numeric(8, 2)), CAST(8.50 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (56, 2, 10, 6, 9, N'Frame window', CAST(4.00 AS Numeric(8, 2)), CAST(7.50 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (57, 2, 8, 6, 6, N'Main menu', CAST(6.00 AS Numeric(8, 2)), CAST(7.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (58, 2, 12, 8, 9, N'Event Tab', CAST(16.00 AS Numeric(8, 2)), CAST(12.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (59, 2, 12, 7, 9, N'Location Tab', CAST(10.00 AS Numeric(8, 2)), CAST(12.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (60, 2, 9, 8, 8, N'Problem domain for system', CAST(32.00 AS Numeric(8, 2)), CAST(44.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (61, 2, 7, 7, 7, N'Extended attributes', CAST(6.00 AS Numeric(8, 2)), CAST(6.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (62, 2, 7, 8, 7, N'Triggers and stored procedures', CAST(28.00 AS Numeric(8, 2)), CAST(32.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (63, 2, 7, 7, 7, N'Database design', CAST(12.00 AS Numeric(8, 2)), CAST(10.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (64, 2, 14, 7, 6, N'On-line help', CAST(40.00 AS Numeric(8, 2)), CAST(40.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (65, 2, 11, 7, 6, N'Install on main server', CAST(15.00 AS Numeric(8, 2)), CAST(20.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (66, 2, 11, 6, 6, N'Install on remote PCs', CAST(9.00 AS Numeric(8, 2)), CAST(12.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (67, 2, 13, 7, 6, N'Year to date results', CAST(8.00 AS Numeric(8, 2)), CAST(5.50 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (68, 2, 13, 8, 6, N'Event Schedule', CAST(16.00 AS Numeric(8, 2)), CAST(16.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (69, 2, 13, 8, 6, N'Prize report', CAST(28.00 AS Numeric(8, 2)), CAST(20.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (70, 1, 1, 1, 2, N'Deviation dialog', CAST(4.00 AS Numeric(8, 2)), CAST(2.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (71, 1, 1, 1, 2, N'Project estimation dialog', CAST(8.00 AS Numeric(8, 2)), CAST(3.50 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (72, 1, 1, 1, 2, N'Project analyzer dialog', CAST(10.00 AS Numeric(8, 2)), CAST(8.50 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (73, 1, 1, 3, 1, N'Project wizard', CAST(32.00 AS Numeric(8, 2)), CAST(19.50 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (74, 1, 1, 2, 1, N'Properties dialog', CAST(14.00 AS Numeric(8, 2)), CAST(10.50 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (75, 1, 1, 2, 1, N'Actual hours dialog', CAST(16.00 AS Numeric(8, 2)), CAST(4.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (76, 1, 1, 2, 1, N'Estimated hours dialog', CAST(14.00 AS Numeric(8, 2)), CAST(6.50 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (77, 1, 1, 3, 2, N'Project list sheet', CAST(52.00 AS Numeric(8, 2)), CAST(32.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (78, 1, 4, 3, 1, N'Project Analyzer Report', CAST(50.00 AS Numeric(8, 2)), CAST(32.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (79, 1, 4, 3, 2, N'Project Estimation Report', CAST(45.00 AS Numeric(8, 2)), CAST(47.50 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (80, 1, 6, 5, 1, N'Analysis and design documents', CAST(27.00 AS Numeric(8, 2)), CAST(23.50 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (81, 1, 2, 4, 3, N'Table Creation', CAST(12.00 AS Numeric(8, 2)), CAST(8.50 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (82, 1, 2, 4, 3, N'Table Maintenance', CAST(12.00 AS Numeric(8, 2)), CAST(6.50 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (83, 1, 2, 4, 3, N'Design and layout', CAST(20.00 AS Numeric(8, 2)), CAST(20.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (84, 1, 5, 1, 1, N'Frame menu', CAST(4.00 AS Numeric(8, 2)), CAST(3.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (85, 1, 5, 2, 1, N'Master menu', CAST(12.00 AS Numeric(8, 2)), CAST(4.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (86, 1, 3, 2, 1, N'Actual Tab', CAST(10.00 AS Numeric(8, 2)), CAST(5.00 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (87, 1, 3, 2, 1, N'Properties Tab', CAST(18.00 AS Numeric(8, 2)), CAST(5.50 AS Numeric(8, 2)))
INSERT [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id], [COMPLEXITY_ID], [ROLE_ID], [NAME], [estimated_hours], [ACTUAL_HOURS]) VALUES (88, 1, 3, 2, 1, N'Estimation Tab', CAST(14.00 AS Numeric(8, 2)), CAST(3.00 AS Numeric(8, 2)))
GO
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (1, 1, N'Simple Visual Object', CAST(8.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (2, 1, N'Average Visual Object', CAST(14.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (3, 1, N'Complex Visual Object', CAST(28.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (4, 1, N'Database Object', CAST(16.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (5, 1, N'Business Object', CAST(18.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (6, 2, N'Easy Object', CAST(9.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (7, 2, N'Average Object', CAST(15.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (8, 2, N'Complex Object', CAST(28.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (9, 3, N'Easy Object', CAST(8.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (10, 3, N'Intermediate Object', CAST(12.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (11, 3, N'Average Object', CAST(24.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (12, 3, N'Complex Object', CAST(36.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (13, 4, N'Easy Visual Object', CAST(8.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (14, 4, N'Average Visual Object', CAST(14.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (15, 4, N'Complex Visual Object', CAST(30.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (16, 4, N'Business Object', CAST(12.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (17, 4, N'Database Object', CAST(9.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (18, 5, N'Easy Object', CAST(4.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (19, 5, N'Intermediate Object', CAST(8.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (20, 5, N'Average Object', CAST(12.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (21, 5, N'Complex Object', CAST(20.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (22, 5, N'Really Really Hard Object', CAST(55.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (23, 6, N'Design Object', CAST(25.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (24, 6, N'Analysis Object', CAST(32.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (25, 7, N'Easy Object', CAST(8.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (26, 7, N'Complex Object', CAST(24.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (27, 7, N'Average Object', CAST(16.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (28, 7, N'Easy Report', CAST(12.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (29, 7, N'Average Report', CAST(18.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (30, 7, N'Complex Report', CAST(28.00 AS Numeric(8, 2)))
INSERT [dbo].[project_complexity] ([complexity_id], [project_id], [name], [estimated_hours]) VALUES (31, 4, N'NonVisual Object', CAST(16.00 AS Numeric(8, 2)))
GO
INSERT [dbo].[project_derived_item] ([derived_item_id], [project_id], [name], [percentage], [rate], [actual_hours]) VALUES (1, 1, N'Project Management', CAST(10.00 AS Numeric(5, 2)), CAST(100.00 AS Numeric(8, 2)), CAST(23.50 AS Numeric(8, 2)))
INSERT [dbo].[project_derived_item] ([derived_item_id], [project_id], [name], [percentage], [rate], [actual_hours]) VALUES (2, 1, N'Contingency', CAST(15.00 AS Numeric(5, 2)), CAST(55.00 AS Numeric(8, 2)), CAST(45.50 AS Numeric(8, 2)))
INSERT [dbo].[project_derived_item] ([derived_item_id], [project_id], [name], [percentage], [rate], [actual_hours]) VALUES (3, 1, N'System Testing', CAST(30.00 AS Numeric(5, 2)), CAST(55.00 AS Numeric(8, 2)), CAST(50.00 AS Numeric(8, 2)))
INSERT [dbo].[project_derived_item] ([derived_item_id], [project_id], [name], [percentage], [rate], [actual_hours]) VALUES (4, 2, N'Project Management', CAST(10.00 AS Numeric(5, 2)), CAST(75.00 AS Numeric(8, 2)), CAST(45.00 AS Numeric(8, 2)))
INSERT [dbo].[project_derived_item] ([derived_item_id], [project_id], [name], [percentage], [rate], [actual_hours]) VALUES (5, 2, N'Contingency', CAST(15.00 AS Numeric(5, 2)), CAST(48.50 AS Numeric(8, 2)), CAST(40.00 AS Numeric(8, 2)))
INSERT [dbo].[project_derived_item] ([derived_item_id], [project_id], [name], [percentage], [rate], [actual_hours]) VALUES (6, 2, N'System Testing', CAST(30.00 AS Numeric(5, 2)), CAST(50.00 AS Numeric(8, 2)), CAST(90.00 AS Numeric(8, 2)))
INSERT [dbo].[project_derived_item] ([derived_item_id], [project_id], [name], [percentage], [rate], [actual_hours]) VALUES (7, 2, N'User Training', CAST(10.00 AS Numeric(5, 2)), CAST(25.00 AS Numeric(8, 2)), CAST(25.00 AS Numeric(8, 2)))
INSERT [dbo].[project_derived_item] ([derived_item_id], [project_id], [name], [percentage], [rate], [actual_hours]) VALUES (8, 3, N'Project Management', CAST(10.00 AS Numeric(5, 2)), CAST(87.50 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_derived_item] ([derived_item_id], [project_id], [name], [percentage], [rate], [actual_hours]) VALUES (9, 3, N'Contingency', CAST(15.00 AS Numeric(5, 2)), CAST(55.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_derived_item] ([derived_item_id], [project_id], [name], [percentage], [rate], [actual_hours]) VALUES (10, 3, N'System Testing', CAST(25.00 AS Numeric(5, 2)), CAST(55.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_derived_item] ([derived_item_id], [project_id], [name], [percentage], [rate], [actual_hours]) VALUES (11, 4, N'Project Management', CAST(8.00 AS Numeric(5, 2)), CAST(75.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_derived_item] ([derived_item_id], [project_id], [name], [percentage], [rate], [actual_hours]) VALUES (12, 4, N'System Testing', CAST(12.00 AS Numeric(5, 2)), CAST(40.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_derived_item] ([derived_item_id], [project_id], [name], [percentage], [rate], [actual_hours]) VALUES (13, 4, N'Help Documentation', CAST(15.00 AS Numeric(5, 2)), CAST(76.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_derived_item] ([derived_item_id], [project_id], [name], [percentage], [rate], [actual_hours]) VALUES (14, 5, N'Project Management', CAST(10.00 AS Numeric(5, 2)), CAST(95.00 AS Numeric(8, 2)), CAST(12.00 AS Numeric(8, 2)))
INSERT [dbo].[project_derived_item] ([derived_item_id], [project_id], [name], [percentage], [rate], [actual_hours]) VALUES (15, 5, N'Contingency', CAST(5.00 AS Numeric(5, 2)), CAST(43.50 AS Numeric(8, 2)), CAST(7.00 AS Numeric(8, 2)))
INSERT [dbo].[project_derived_item] ([derived_item_id], [project_id], [name], [percentage], [rate], [actual_hours]) VALUES (16, 6, N'Project Management', CAST(15.00 AS Numeric(5, 2)), CAST(150.00 AS Numeric(8, 2)), NULL)
INSERT [dbo].[project_derived_item] ([derived_item_id], [project_id], [name], [percentage], [rate], [actual_hours]) VALUES (17, 7, N'Project Management', CAST(10.00 AS Numeric(5, 2)), CAST(55.00 AS Numeric(8, 2)), CAST(32.00 AS Numeric(8, 2)))
INSERT [dbo].[project_derived_item] ([derived_item_id], [project_id], [name], [percentage], [rate], [actual_hours]) VALUES (18, 7, N'System Testing', CAST(15.00 AS Numeric(5, 2)), CAST(47.50 AS Numeric(8, 2)), CAST(45.00 AS Numeric(8, 2)))
INSERT [dbo].[project_derived_item] ([derived_item_id], [project_id], [name], [percentage], [rate], [actual_hours]) VALUES (19, 7, N'User Training', CAST(15.00 AS Numeric(5, 2)), CAST(33.50 AS Numeric(8, 2)), CAST(23.00 AS Numeric(8, 2)))
GO
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (1, 1, N'Kelli Roddy', CAST(100.00 AS Numeric(8, 2)), CAST(0.50 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (2, 1, N'Chuck Miller', CAST(100.00 AS Numeric(8, 2)), CAST(0.50 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (3, 1, N'Tim Meany', CAST(55.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (4, 1, N'John Henderson', CAST(75.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (5, 1, N'Dick Weber', CAST(450.00 AS Numeric(8, 2)), CAST(2.00 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (6, 2, N'Linda Mahoney', CAST(75.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (7, 2, N'Kari Wilson', CAST(45.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (8, 2, N'Betsy Smith', CAST(55.00 AS Numeric(8, 2)), CAST(0.75 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (9, 2, N'Tim Verilin', CAST(30.00 AS Numeric(8, 2)), CAST(2.00 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (10, 3, N'Jill Ortberg', CAST(87.50 AS Numeric(8, 2)), CAST(1.25 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (11, 3, N'Karen Baumgartner', CAST(76.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (12, 3, N'Daneen Olsen', CAST(45.00 AS Numeric(8, 2)), CAST(1.50 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (13, 3, N'Jeff Kirkpatrick', CAST(55.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (14, 3, N'Fred Lorrie', CAST(45.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (15, 4, N'Kim Seebeck', CAST(78.75 AS Numeric(8, 2)), CAST(1.00 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (16, 4, N'Bret Johnson', CAST(55.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (17, 4, N'Gus Steveson', CAST(450.00 AS Numeric(8, 2)), CAST(1.50 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (18, 4, N'Peter Schmidt', CAST(55.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (19, 5, N'Chuck Miller', CAST(95.00 AS Numeric(8, 2)), CAST(0.33 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (20, 5, N'Eva Christenson', CAST(55.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (21, 5, N'Collin O''Malloy', CAST(45.00 AS Numeric(8, 2)), CAST(1.50 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (22, 6, N'Harry Hill', CAST(150.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (23, 6, N'Jimmy Smith', CAST(75.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (24, 6, N'Mary Henderson', CAST(75.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (25, 7, N'Kendal Miller', CAST(55.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (26, 7, N'Susan Stewart', CAST(55.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (27, 7, N'Steve Amway', CAST(33.50 AS Numeric(8, 2)), CAST(2.50 AS Numeric(5, 2)))
INSERT [dbo].[project_role] ([role_id], [project_id], [name], [rate], [multipler]) VALUES (28, 7, N'Chris Nelson', CAST(45.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(5, 2)))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [pbcatc_x]    Script Date: 3/4/2021 4:55:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [pbcatc_x] ON [dbo].[pbcatcol]
(
	[pbc_tnam] ASC,
	[pbc_ownr] ASC,
	[pbc_cnam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [pbcate_x]    Script Date: 3/4/2021 4:55:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [pbcate_x] ON [dbo].[pbcatedt]
(
	[pbe_name] ASC,
	[pbe_seqn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [pbcatf_x]    Script Date: 3/4/2021 4:55:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [pbcatf_x] ON [dbo].[pbcatfmt]
(
	[pbf_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [pbcatt_x]    Script Date: 3/4/2021 4:55:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [pbcatt_x] ON [dbo].[pbcattbl]
(
	[pbt_tnam] ASC,
	[pbt_ownr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [pbcatv_x]    Script Date: 3/4/2021 4:55:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [pbcatv_x] ON [dbo].[pbcatvld]
(
	[pbv_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[project_category]  WITH CHECK ADD  CONSTRAINT [FK_project_category_project] FOREIGN KEY([project_id])
REFERENCES [dbo].[project] ([PROJECT_ID])
GO
ALTER TABLE [dbo].[project_category] CHECK CONSTRAINT [FK_project_category_project]
GO
ALTER TABLE [dbo].[project_category_item]  WITH CHECK ADD  CONSTRAINT [FK_project_category_item_project] FOREIGN KEY([PROJECT_ID])
REFERENCES [dbo].[project] ([PROJECT_ID])
GO
ALTER TABLE [dbo].[project_category_item] CHECK CONSTRAINT [FK_project_category_item_project]
GO
ALTER TABLE [dbo].[project_category_item]  WITH CHECK ADD  CONSTRAINT [FK_project_category_item_project_category] FOREIGN KEY([category_id], [PROJECT_ID])
REFERENCES [dbo].[project_category] ([category_id], [project_id])
GO
ALTER TABLE [dbo].[project_category_item] CHECK CONSTRAINT [FK_project_category_item_project_category]
GO
ALTER TABLE [dbo].[project_category_item]  WITH CHECK ADD  CONSTRAINT [FK_project_category_item_project_category_item] FOREIGN KEY([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id])
REFERENCES [dbo].[project_category_item] ([CATEGORY_ITEM_ID], [PROJECT_ID], [category_id])
GO
ALTER TABLE [dbo].[project_category_item] CHECK CONSTRAINT [FK_project_category_item_project_category_item]
GO
ALTER TABLE [dbo].[project_category_item]  WITH CHECK ADD  CONSTRAINT [FK_project_category_item_project_complexity] FOREIGN KEY([COMPLEXITY_ID], [PROJECT_ID])
REFERENCES [dbo].[project_complexity] ([complexity_id], [project_id])
GO
ALTER TABLE [dbo].[project_category_item] CHECK CONSTRAINT [FK_project_category_item_project_complexity]
GO
ALTER TABLE [dbo].[project_category_item]  WITH CHECK ADD  CONSTRAINT [FK_project_category_item_project_role] FOREIGN KEY([ROLE_ID], [PROJECT_ID])
REFERENCES [dbo].[project_role] ([role_id], [project_id])
GO
ALTER TABLE [dbo].[project_category_item] CHECK CONSTRAINT [FK_project_category_item_project_role]
GO
ALTER TABLE [dbo].[project_complexity]  WITH CHECK ADD  CONSTRAINT [FK_project_complexity_project] FOREIGN KEY([project_id])
REFERENCES [dbo].[project] ([PROJECT_ID])
GO
ALTER TABLE [dbo].[project_complexity] CHECK CONSTRAINT [FK_project_complexity_project]
GO
ALTER TABLE [dbo].[project_derived_item]  WITH CHECK ADD  CONSTRAINT [FK_project_derived_item_project] FOREIGN KEY([project_id])
REFERENCES [dbo].[project] ([PROJECT_ID])
GO
ALTER TABLE [dbo].[project_derived_item] CHECK CONSTRAINT [FK_project_derived_item_project]
GO
ALTER TABLE [dbo].[project_role]  WITH CHECK ADD  CONSTRAINT [FK_project_role_project] FOREIGN KEY([project_id])
REFERENCES [dbo].[project] ([PROJECT_ID])
GO
ALTER TABLE [dbo].[project_role] CHECK CONSTRAINT [FK_project_role_project]
GO
USE [master]
GO
ALTER DATABASE [PEAT] SET  READ_WRITE 
GO
