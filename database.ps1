$currentpath = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$classpath = $currentpath + "\lib\liquibase.jar;"
$classpath += $currentpath + "\lib\sqljdbc4.jar"

# Verifica se foi informado o parametro de ambiente
If (-Not ($args[0].StartsWith("--env="))) {
  throw [System.ArgumentException] "Necessario informar o ambiente --env=<ambiente>, devera ser o primeiro parametro.`n   Ex.: database.ps1 --env=qa status"
}

# Verifica se existe o arquivo de configuracao do ambiente
$env = $args[0] -replace "--env=", ""
$configFile = "$($env).properties"
If (-Not (Test-Path databases\$configFile)) {
  throw [System.IO.FileNotFoundException] "O arquivo de configuracao $($configFile) nao foi encontrado na pasta databases."
}

java -Denv="$currentpath" -cp "$classpath" liquibase.integration.commandline.Main --changeLogFile=changelog-master.xml --defaultsFile=databases\$configFile $args[1..($args.length - 1)]