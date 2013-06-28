function extract-invoker-ips {
	grep ":80\b /invoker/JMXInvokerServlet does not require authentication (200)" /tmp/vulnscan.log > /tmp/invoker.ips.80
	grep ":8080\b /invoker/JMXInvokerServlet does not require authentication (200)" /tmp/vulnscan.log > /tmp/invoker.ips.8080
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/invoker.ips.80 > /tmp/invoker-ips.80
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/invoker.ips.80 > /tmp/invoker-ips.8080
	rm -vf /tmp/invoker.ips*
}

function extract-jmx-ips {
	grep ":80\b /jmx-console/HtmlAdaptor does not require authentication (200)" /tmp/vulnscan.log > /tmp/jmx.ips.80
	grep ":8080\b /jmx-console/HtmlAdaptor does not require authentication (200)" /tmp/vulnscan.log > /tmp/jmx.ips.8080
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/jmx.ips.80 > /tmp/jmx-ips.80
	grep -o -P "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b" /tmp/jmx.ips.80 > /tmp/jmx-ips.8080
	rm -vf /tmp/jmx.ips*
	}
