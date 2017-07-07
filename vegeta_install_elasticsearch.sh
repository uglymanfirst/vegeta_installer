echo "                                     , ";
echo "                               ,   ,'| ";
echo "                             ,/|.-'   \. ";
echo "                          .-'  '       |. ";
echo "                    ,  .-'              | ";
echo "                   /|,'                 |' ";
echo "                  / '                    |  , ";
echo "                 /                       ,'/ ";
echo "              .  |          _              / ";
echo "               \ \`\' .-.    ,\' \`.           | ";
echo "                \ /   \ /      \          / ";
echo "                 \|    V        |        |  , ";
echo "                  (           ) /.--.   \'\'\"/ ";
echo "                  \"b.\`. ,\' _.ee\'\' 6)|   ,-\' ";
echo "                    \\\"= --\"\"  )   \' /.-\' ";
echo "                     \\ / \`---\"   .\"\|\' ";
echo "                      \"..-    .\'  \|. ";
echo "                       \`-__..-\',\'   \| ";
echo "                     __.) \' .-\'/    /\._ ";
echo "               _.--\'/----..--------. _.-\"\"-._ ";
echo "            .-\'_)   \.   /     __..-\'     _.-\'--. ";
echo "           / -\'/      \"\"\"\"\"\"\"\"\"         ,\'-.   . \`. ";
echo "          | \' /            |            /    \`   \`. \ ";
echo "          |   |             |           |         | | ";
echo "           \ .\'\           |           |     \     | ";
echo "          / \'  | ,\'       \_       . -  \`.    |  / / ";
echo "         / /   | |                      \`/\"--. -\' /\ ";
echo "        | |     \ \                     /     \     | ";
echo "        | \      | \                  .-|      |    | ";
echo ;
echo "███████╗██╗      █████╗ ███████╗████████╗██╗ ██████╗███████╗███████╗ █████╗ ██████╗  ██████╗██╗  ██╗       ███████╗███████╗██╗   ██╗";
echo "██╔════╝██║     ██╔══██╗██╔════╝╚══██╔══╝██║██╔════╝██╔════╝██╔════╝██╔══██╗██╔══██╗██╔════╝██║  ██║       ██╔════╝██╔════╝██║   ██║";
echo "█████╗  ██║     ███████║███████╗   ██║   ██║██║     ███████╗█████╗  ███████║██████╔╝██║     ███████║       ███████╗█████╗  ██║   ██║";
echo "██╔══╝  ██║     ██╔══██║╚════██║   ██║   ██║██║     ╚════██║██╔══╝  ██╔══██║██╔══██╗██║     ██╔══██║       ╚════██║██╔══╝  ██║   ██║";
echo "███████╗███████╗██║  ██║███████║   ██║   ██║╚██████╗███████║███████╗██║  ██║██║  ██║╚██████╗██║  ██║▄█╗    ███████║███████╗╚██████╔╝";
echo "╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝ ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝    ╚══════╝╚══════╝ ╚═════╝ ";
echo "                                                                                                                                    ";
echo "██╗   ██╗███████╗██████╗ ███╗   ███╗███████╗    ██╗███╗   ██╗███████╗ ██████╗ ██╗     ███████╗███╗   ██╗████████╗███████╗██╗        ";
echo "██║   ██║██╔════╝██╔══██╗████╗ ████║██╔════╝    ██║████╗  ██║██╔════╝██╔═══██╗██║     ██╔════╝████╗  ██║╚══██╔══╝██╔════╝██║        ";
echo "██║   ██║█████╗  ██████╔╝██╔████╔██║█████╗      ██║██╔██╗ ██║███████╗██║   ██║██║     █████╗  ██╔██╗ ██║   ██║   █████╗  ██║        ";
echo "╚██╗ ██╔╝██╔══╝  ██╔══██╗██║╚██╔╝██║██╔══╝      ██║██║╚██╗██║╚════██║██║   ██║██║     ██╔══╝  ██║╚██╗██║   ██║   ██╔══╝  ╚═╝        ";
echo " ╚████╔╝ ███████╗██║  ██║██║ ╚═╝ ██║███████╗    ██║██║ ╚████║███████║╚██████╔╝███████╗███████╗██║ ╚████║   ██║   ███████╗██╗        ";
echo "  ╚═══╝  ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝        ";
echo "                                                                                                                                    ";

#
# -------------------------------------------------------------------------------------------
# Instala o insolente do Java
# -------------------------------------------------------------------------------------------
sudo apt-get update
sudo apt-get install default-jre
sudo apt-get install default-jdk

JAVAPATH= readlink -f $(which java)
sudo export JAVA_HOME=$JAVAPATH
source /etc/environment

# -------------------------------------------------------------------------------------------
# Instala o insolente do Elasticsearch v5.5
# -------------------------------------------------------------------------------------------
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.5.0.deb
sha1sum elasticsearch-5.5.0.deb 
sudo dpkg -i elasticsearch-5.5.0.deb

# -------------------------------------------------------------------------------------------
# Configura o Elasticsearch após a instalação
# ------------------------------------------------------------------------------------------- 
sudo sed -i -e 's/-Xms2g/-Xms512m/g' /etc/elasticsearch/jvm.options
sudo sed -i -e 's/-Xmx2g/-Xmx512m/g' /etc/elasticsearch/jvm.options
sudo sed -i -e 's/#network.host: 198.0.0.1/network.host: 0.0.0.0/g' /etc/elasticsearch/elasticsearch.yml
sudo sed -i -e 's/#http.port: 9200/http.port: 9200/g' /etc/elasticsearch/elasticsearch.yml

# -------------------------------------------------------------------------------------------
# Habilita que a insolencia do Elasticsearch se inicie como serviço
# -------------------------------------------------------------------------------------------
echo
echo
echo "   ▄█   ▄█▄    ▄████████    ▄█   ▄█▄    ▄████████    ▄████████  ▄██████▄      ███      ▄██████▄   ▄██████▄   ▄██████▄  ";
echo "  ███ ▄███▀   ███    ███   ███ ▄███▀   ███    ███   ███    ███ ███    ███ ▀█████████▄ ███    ███ ███    ███ ███    ███ ";
echo "  ███▐██▀     ███    ███   ███▐██▀     ███    ███   ███    ███ ███    ███    ▀███▀▀██ ███    ███ ███    ███ ███    ███ ";
echo " ▄█████▀      ███    ███  ▄█████▀      ███    ███  ▄███▄▄▄▄██▀ ███    ███     ███   ▀ ███    ███ ███    ███ ███    ███ ";
echo "▀▀█████▄    ▀███████████ ▀▀█████▄    ▀███████████ ▀▀███▀▀▀▀▀   ███    ███     ███     ███    ███ ███    ███ ███    ███ ";
echo "  ███▐██▄     ███    ███   ███▐██▄     ███    ███ ▀███████████ ███    ███     ███     ███    ███ ███    ███ ███    ███ ";
echo "  ███ ▀███▄   ███    ███   ███ ▀███▄   ███    ███   ███    ███ ███    ███     ███     ███    ███ ███    ███ ███    ███ ";
echo "  ███   ▀█▀   ███    █▀    ███   ▀█▀   ███    █▀    ███    ███  ▀██████▀     ▄████▀    ▀██████▀   ▀██████▀   ▀██████▀  ";
echo "  ▀                        ▀                        ███    ███                                                         ";
echo
echo

read -p "Você quer habilitar o insolente do Elasticsearch como um serviço? [y|n]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo /bin/systemctl daemon-reload
	sudo /bin/systemctl enable elasticsearch.service
	echo
	echo
	echo "███████╗███████╗████████╗ █████╗     ██╗  ██╗ █████╗ ██████╗ ██╗██╗     ██╗████████╗ █████╗ ██████╗  ██████╗ ";
	echo "██╔════╝██╔════╝╚══██╔══╝██╔══██╗    ██║  ██║██╔══██╗██╔══██╗██║██║     ██║╚══██╔══╝██╔══██╗██╔══██╗██╔═══██╗";
	echo "█████╗  ███████╗   ██║   ███████║    ███████║███████║██████╔╝██║██║     ██║   ██║   ███████║██║  ██║██║   ██║";
	echo "██╔══╝  ╚════██║   ██║   ██╔══██║    ██╔══██║██╔══██║██╔══██╗██║██║     ██║   ██║   ██╔══██║██║  ██║██║   ██║";
	echo "███████╗███████║   ██║   ██║  ██║    ██║  ██║██║  ██║██████╔╝██║███████╗██║   ██║   ██║  ██║██████╔╝╚██████╔╝▄█╗";
	echo "╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝╚══════╝╚═╝   ╚═╝   ╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝";
	echo "                                                                                                             ";
	echo "               ███████╗███████╗██╗   ██╗    ██╗   ██╗███████╗██████╗ ███╗   ███╗███████╗██╗                  ";
	echo "               ██╔════╝██╔════╝██║   ██║    ██║   ██║██╔════╝██╔══██╗████╗ ████║██╔════╝██║                  ";
	echo "               ███████╗█████╗  ██║   ██║    ██║   ██║█████╗  ██████╔╝██╔████╔██║█████╗  ██║                  ";
	echo "               ╚════██║██╔══╝  ██║   ██║    ╚██╗ ██╔╝██╔══╝  ██╔══██╗██║╚██╔╝██║██╔══╝  ╚═╝                  ";
	echo "               ███████║███████╗╚██████╔╝     ╚████╔╝ ███████╗██║  ██║██║ ╚═╝ ██║███████╗██╗                  ";
	echo "               ╚══════╝╚══════╝ ╚═════╝       ╚═══╝  ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝                  ";
	echo "                                                                                                             ";
	echo
	echo
fi

sudo /bin/systemctl start elasticsearch

# -------------------------------------------------------------------------------------------
# Testa se o verme insolente do elastic é capaz de responder com a boca cheia de sangue
# -------------------------------------------------------------------------------------------

curl -XGET 'localhost:9200/?pretty'  
CURL_RC=$?

if [ ${CURL_RC} -ne 0 ]; then
    echo " Elasticsearch falhou de forma miserável! ${CURL_RC}"
else
    echo
    echo
    echo
    echo "███╗   ███╗ █████╗ ██╗     ██████╗ ██╗████████╗ ██████╗                                                        ";
    echo "████╗ ████║██╔══██╗██║     ██╔══██╗██║╚══██╔══╝██╔═══██╗                                                       ";
    echo "██╔████╔██║███████║██║     ██║  ██║██║   ██║   ██║   ██║                                                       ";
    echo "██║╚██╔╝██║██╔══██║██║     ██║  ██║██║   ██║   ██║   ██║                                                       ";
    echo "██║ ╚═╝ ██║██║  ██║███████╗██████╔╝██║   ██║   ╚██████╔╝                                                       ";
    echo "╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝   ╚═╝    ╚═════╝                                                        ";
    echo "                                                                                                               ";
    echo "███████╗██╗      █████╗ ███████╗████████╗██╗███████╗███████╗ █████╗ ██████╗  ██████╗██╗  ██╗██╗                ";
    echo "██╔════╝██║     ██╔══██╗██╔════╝╚══██╔══╝██║██╔════╝██╔════╝██╔══██╗██╔══██╗██╔════╝██║  ██║██║                ";
    echo "█████╗  ██║     ███████║███████╗   ██║   ██║███████╗█████╗  ███████║██████╔╝██║     ███████║██║                ";
    echo "██╔══╝  ██║     ██╔══██║╚════██║   ██║   ██║╚════██║██╔══╝  ██╔══██║██╔══██╗██║     ██╔══██║╚═╝                ";
    echo "███████╗███████╗██║  ██║███████║   ██║   ██║███████║███████╗██║  ██║██║  ██║╚██████╗██║  ██║██╗                ";
    echo "╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝                ";
    echo "                                                                                                               ";
    echo "████████╗███████╗███╗   ███╗    ██╗   ██╗███╗   ███╗    ██████╗  ██████╗ ██████╗ ███████╗██████╗               ";
    echo "╚══██╔══╝██╔════╝████╗ ████║    ██║   ██║████╗ ████║    ██╔══██╗██╔═══██╗██╔══██╗██╔════╝██╔══██╗              ";
    echo "   ██║   █████╗  ██╔████╔██║    ██║   ██║██╔████╔██║    ██████╔╝██║   ██║██║  ██║█████╗  ██████╔╝              ";
    echo "   ██║   ██╔══╝  ██║╚██╔╝██║    ██║   ██║██║╚██╔╝██║    ██╔═══╝ ██║   ██║██║  ██║██╔══╝  ██╔══██╗              ";
    echo "   ██║   ███████╗██║ ╚═╝ ██║    ╚██████╔╝██║ ╚═╝ ██║    ██║     ╚██████╔╝██████╔╝███████╗██║  ██║              ";
    echo "   ╚═╝   ╚══════╝╚═╝     ╚═╝     ╚═════╝ ╚═╝     ╚═╝    ╚═╝      ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝              ";
    echo "                                                                                                               ";
    echo "███╗   ███╗ █████╗ ██╗ ██████╗ ██████╗      ██████╗ ██╗   ██╗███████╗     █████╗  ██████╗  ██████╗  ██████╗ ██╗";
    echo "████╗ ████║██╔══██╗██║██╔═══██╗██╔══██╗    ██╔═══██╗██║   ██║██╔════╝    ██╔══██╗██╔═████╗██╔═████╗██╔═████╗██║";
    echo "██╔████╔██║███████║██║██║   ██║██████╔╝    ██║   ██║██║   ██║█████╗      ╚█████╔╝██║██╔██║██║██╔██║██║██╔██║██║";
    echo "██║╚██╔╝██║██╔══██║██║██║   ██║██╔══██╗    ██║▄▄ ██║██║   ██║██╔══╝      ██╔══██╗████╔╝██║████╔╝██║████╔╝██║╚═╝";
    echo "██║ ╚═╝ ██║██║  ██║██║╚██████╔╝██║  ██║    ╚██████╔╝╚██████╔╝███████╗    ╚█████╔╝╚██████╔╝╚██████╔╝╚██████╔╝██╗";
    echo "╚═╝     ╚═╝╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═╝  ╚═╝     ╚══▀▀═╝  ╚═════╝ ╚══════╝     ╚════╝  ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝";
    echo "                                                                                                               ";
    echo
    echo
    echo
    echo
fi

