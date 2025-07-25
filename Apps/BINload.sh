#!/data/data/com.termux/files/usr/bin/bash

SIGNATURE="KTBASHES"

# Caminho do menu principal do Kat#BASHes
MENU_SH="$HOME/KTBASHes/menu.sh"

# Usar dialog para capturar o comando do usuário
cmd=$(dialog --backtitle "Kat#BASHes" \
             --title "BINload - Executar Comando" \
             --inputbox "Digite o comando para executar:" 10 50 \
             3>&1 1>&2 2>&3)

# Capturar o código de saída do dialog
exit_status=$?

# Limpar a tela
clear

# Se o usuário pressionou OK (código 0)
if [ $exit_status -eq 0 ]; then
    echo "[BINload] Executando: $cmd"
    sleep 2
    bash -c "$cmd"
    echo ""
    echo "[BINload] Execução finalizada. Voltando ao menu..."
    sleep 2
    bash "$MENU_SH"
else
    echo "[BINload] Cancelado. Voltando ao menu..."
    sleep 1
    bash "$MENU_SH"
fi