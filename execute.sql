-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: changelog-master.xml
-- Ran at: 28/10/16 10:49
-- Against: usrDEV@jdbc:sqlserver://127.0.0.1:1433;authenticationScheme=nativeAuthentication;xopenStates=false;sendTimeAsDatetime=true;trustServerCertificate=false;sendStringParametersAsUnicode=true;selectMethod=direct;responseBuffering=adaptive;packetSize=8000;multiSubnetFailover=false;loginTimeout=15;lockTimeout=-1;lastUpdateCount=true;encrypt=false;disableStatementPooling=true;databaseName=LiquiBaseDev;applicationName=Microsoft JDBC Driver for SQL Server;applicationIntent=readwrite;
-- Liquibase version: 3.5.1
-- *********************************************************************

USE [LiquiBaseDev];
GO

-- Lock Database
UPDATE [dbo].[DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = 'NB-002438 (10.99.2.64)', [LOCKGRANTED] = '2016-10-28T10:49:33.049' WHERE [ID] = 1 AND [LOCKED] = 0
GO

-- Changeset changelogs/changelog-2.0.0.runalways.parametros.xml::20160826-0000::giovani
-- Limpara a tabela de par├ómetros para atualizar com os valores do ambiente (dsv, tst ou prd).
TRUNCATE TABLE [adm].[PARAMETROS]
GO

UPDATE [dbo].[DATABASECHANGELOG] SET [DATEEXECUTED] = GETDATE(), [EXECTYPE] = 'RERAN', [MD5SUM] = '7:d871a411957e6f8abff1bf8a57094076' WHERE [ID] = '20160826-0000' AND [AUTHOR] = 'giovani' AND [FILENAME] = 'changelogs/changelog-2.0.0.runalways.parametros.xml'
GO

-- Changeset changelogs/changelog-2.0.0.runalways.parametros.xml::20160826-0010::giovani
-- Carregar par├ómetros para o ambiente de DEV.
-- WARNING The following SQL may change each run and therefore is possibly incorrect and/or invalid:
INSERT INTO [adm].[PARAMETROS] ([CHAVE], [VALOR]) VALUES ('PARAMETRO-DSV1', 'VALOR-DSV1'),('PARAMETRO-DSV2', 'VALOR-DSV2'),('PARAMETRO-DSV3', 'VALOR-DSV3'),('PARAMETRO-DSV4', 'VALOR-DSV4');
GO

UPDATE [dbo].[DATABASECHANGELOG] SET [DATEEXECUTED] = GETDATE(), [EXECTYPE] = 'RERAN', [MD5SUM] = '7:3b16eaeda1676c36c4aaf5425692ff9c' WHERE [ID] = '20160826-0010' AND [AUTHOR] = 'giovani' AND [FILENAME] = 'changelogs/changelog-2.0.0.runalways.parametros.xml'
GO

-- Changeset changelogs/changelog-3.0.0.xml::20161027-0000::giovani
-- Adiciona campo DTANIVER do usu├írio.
ALTER TABLE [adm].[USUARIOS] ADD [DTANIVER] DATETIME NULL
GO

INSERT INTO [dbo].[DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID]) VALUES ('20161027-0000', 'giovani', 'changelogs/changelog-3.0.0.xml', GETDATE(), 9, '7:3a022893bb2b2cf2b400503b2fee2483', 'sql', N'Adiciona campo DTANIVER do usu├írio.', 'EXECUTED', NULL, NULL, '3.5.1', '7658975249')
GO

-- Changeset changelogs/changelog-3.0.0.xml::20161027-1000::giovani
INSERT INTO [dbo].[DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID], [TAG]) VALUES ('20161027-1000', 'giovani', 'changelogs/changelog-3.0.0.xml', GETDATE(), 10, '7:5c72d6e6029805ede3d60af04f3e1c59', 'tagDatabase', '', 'EXECUTED', NULL, NULL, '3.5.1', '7658975249', '3.0.0')
GO

-- Release Database Lock
UPDATE [dbo].[DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1
GO

