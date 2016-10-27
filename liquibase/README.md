# Liquibase
## liquibase-3.5.1 :: comandos mais utilizados
## Referência: [Liquibase Command Line](http://www.liquibase.org/documentation/command_line.html)

### Verifica Status
```
java -jar .\lib\liquibase.jar --defaultsFile=databases/dsv.properties --changeLogFile=changelog-master.xml status
.\database.ps1 --defaultsFile=databases/dsv.properties --changeLogFile=changelog-master.xml status
```
### Valida o changelog
```
liquibase --defaultsFile=databases/dsv.properties --changeLogFile=changelog-master.xml validate
```
### Atualiza
```
liquibase --defaultsFile=databases/dsv.properties --changeLogFile=changelog-master.xml update
```
## Dezfaz N changesets
```
liquibase --defaultsFile=databases/dsv.properties --changeLogFile=changelog-master.xml rollbackCount 1
```
## Cria uma TAG
```
liquibase --defaultsFile=databases/dsv.properties --changeLogFile=changelog-master.xml tag CI
```
##  Aplica o changeset, faz roolback e aplica novamente
```
liquibase --defaultsFile=databases/dsv.properties --changeLogFile=changelog-master.xml updateTestingRollback
```
## Dezfaz todas as mudanças aplicadas até a marcação
```
liquibase --defaultsFile=databases/dsv.properties --changeLogFile=changelog-master.xml rollback 1.0.1
```
### Faz engenharia reversa
```
liquibase --defaultsFile=databases/dsv.properties --changeLogFile=changelog-master.xml generateChangeLog
```
### Marca ChangeSet como aplicado, mas não aplica
```
liquibase --defaultsFile=databases/dsv.properties --changeLogFile=changelog-master.xml changelogsync
```
## Verifica se existe alguma TAG com nome de tagXYZ
```
liquibase --defaultsFile=databases/dsv.properties --changeLogFile=changelog-master.xml tagExists 1.0.1
```
## Se quebrar o check sum do arquivos (caso tenha sido alterado) arrumar o banco manualmente para últimar versão.
```
liquibase --defaultsFile=databases/dsv.properties --changeLogFile=changelog-master.xml clearCheckSums
```