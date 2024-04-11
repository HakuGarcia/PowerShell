@ECHO OFF 
echo Buscando servico "Nome Do Servico" no servidor "NMDS01"
sc \\NMDS01 query "Nome Do Servico" | find /i "state" | find /i "running"

IF %ERRORLEVEL% NEQ 0 (
    echo Ops, servico nao sendo executado no servidor
) ELSE (
    echo Parando servico...
    sc \\NMDS01 stop "Nome Do Servico" > NUL
    acho Iniciando servico...
    sc \\NMDS01 start "Nome Do Servico" > NUL
    echo Servico Reiniciado com sucesso
)