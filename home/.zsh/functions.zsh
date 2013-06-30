function extract-ips {
##
	grep ":80\b /invoker/JMXInvokerServlet does not require authentication (200)" /tmp/vulnscan.log > /tmp/invoker-ips.80.tmp
	grep ":8080\b /invoker/JMXInvokerServlet does not require authentication (200)" /tmp/vulnscan.log > /tmp/invoker-ips.8080.tmp
	grep ":443 /invoker/JMXInvokerServlet does not require authentication (200)" /tmp/vulnscan.log > /tmp/invoker-ips.443.tmp
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/invoker-ips.80.tmp | sort -u |> /tmp/invoker-ips.80
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/invoker-ips.8080.tmp | sort -u |> /tmp/invoker-ips.8080
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/invoker-ips.443.tmp | sort -u |> /tmp/invoker-ips.443
	rm -vf /tmp/*.tmp
##
	grep ":80\b Got authentication bypass via HTTP verb tampering" /tmp/vulnscan.log > /tmp/auth-bypass-ips.80.tmp
	grep ":8080\b Got authentication bypass via HTTP verb tampering" /tmp/vulnscan.log > /tmp/auth-bypass-ips.8080.tmp
	grep ":443 Got authentication bypass via HTTP verb tampering" /tmp/vulnscan.log > /tmp/auth-bypass-ips.443.tmp
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/auth-bypass-ips.80.tmp | sort -u |> /tmp/auth-bypass-ips.80
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/auth-bypass-ips.8080.tmp | sort -u |> /tmp/auth-bypass-ips.8080
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/auth-bypass-ips.443.tmp | sort -u |> /tmp/auth-bypass-ips.443
	rm -vf /tmp/*.tmp
##
	grep ":80\b Authenticated using admin:admin" /tmp/vulnscan.log > /tmp/admin-ips.80.tmp
	grep ":8080\b Authenticated using admin:admin" /tmp/vulnscan.log > /tmp/admin-ips.8080.tmp
	grep ":443 Authenticated using admin:admin" /tmp/vulnscan.log > /tmp/admin-ips.443.tmp
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/admin-ips.80.tmp | sort -u |> /tmp/admin-ips.80
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/admin-ips.8080.tmp | sort -u |> /tmp/admin-ips.8080
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/admin-ips.443.tmp | sort -u |> /tmp/admin-ips.443
	rm -vf /tmp/*.tmp
##
	grep ":80\b /invoker/JMXInvokerServlet does not require authentication (200)" /tmp/vulnscan.linux.log > /tmp/invoker-ips.80.linux.tmp
	grep ":8080\b /invoker/JMXInvokerServlet does not require authentication (200)" /tmp/vulnscan.linux.log > /tmp/invoker-ips.8080.linux.tmp
	grep ":443 /invoker/JMXInvokerServlet does not require authentication (200)" /tmp/vulnscan.linux.log > /tmp/invoker-ips.443.linux.tmp
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/invoker-ips.80.linux.tmp | sort -u |> /tmp/invoker-ips.80.linux
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/invoker-ips.8080.linux.tmp | sort -u |> /tmp/invoker-ips.8080.linux
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/invoker-ips.443.linux.tmp | sort -u |> /tmp/invoker-ips.443.linux
	rm -vf /tmp/*.linux.tmp
##
	grep ":80\b Got authentication bypass via HTTP verb tampering" /tmp/vulnscan.linux.log > /tmp/auth-bypass-ips.80.linux.tmp
	grep ":8080\b Got authentication bypass via HTTP verb tampering" /tmp/vulnscan.linux.log > /tmp/auth-bypass-ips.8080.linux.tmp
	grep ":443 Got authentication bypass via HTTP verb tampering" /tmp/vulnscan.linux.log > /tmp/auth-bypass-ips.443.linux.tmp
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/auth-bypass-ips.80.linux.tmp | sort -u |> /tmp/auth-bypass-ips.80.linux
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/auth-bypass-ips.8080.linux.tmp | sort -u |> /tmp/auth-bypass-ips.8080.linux
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/auth-bypass-ips.443.linux.tmp | sort -u |> /tmp/auth-bypass-ips.443.linux
	rm -vf /tmp/*.linux.tmp
##
	grep ":80\b Authenticated using admin:admin" /tmp/vulnscan.linux.log > /tmp/admin-ips.80.linux.tmp
	grep ":8080\b Authenticated using admin:admin" /tmp/vulnscan.linux.log > /tmp/admin-ips.8080.linux.tmp
	grep ":443 Authenticated using admin:admin" /tmp/vulnscan.linux.log > /tmp/admin-ips.443.linux.tmp
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/admin-ips.80.linux.tmp | sort -u |> /tmp/admin-ips.80.linux
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/admin-ips.8080.linux.tmp | sort -u |> /tmp/admin-ips.8080.linux
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/admin-ips.443.linux.tmp | sort -u |> /tmp/admin-ips.443.linux
	rm -vf /tmp/*.linux.tmp
}
function cleanup {
	rm -vf ~/{ips*,latest*,*.maff,.tmp/*}
	rm -vf /tmp/ips*
	rm -vfr ~/.urls/{tomcat/*,jboss/*}
	ls -lA ~/.urls/{tomcat,jboss}
}

function extract-urls-tomcat {
	mkdir -p ~/.urls/tomcat
	cd ~/.urls/tomcat
	unzip ~/tomcat.maff
	find . -name index.html -exec cp --backup=t -vf {} . \;
	cat ~/.urls/tomcat/index* >> /tmp/ips.tomcat
	parse-ips /tmp/ips.tomcat | sort -u |>| ~/ips.tomcat
	wc -l ~/ips.tomcat
}

function extract-urls-jboss {
	cd ~/.urls/jboss
	unzip ~/jboss.maff
	find . -name index.html -exec cp --backup=t -vf {} . \;
	cat ~/.urls/jboss/index* >> /tmp/ips.jboss
	parse-ips /tmp/ips.jboss | sort -u |>| ~/ips.jboss
	wc -l ~/ips.jboss
}
