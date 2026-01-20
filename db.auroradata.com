;
; Zona principal auroradata.com
;
$TTL 1M
@   IN  SOA ns01.auroradata.com. admin@auroradata.com. (
        2025112703 ; Serial
        120        ; Refresh (2 min)
        60         ; Retry (1 min)
        86400      ; Expire (1 day)
        60         ; Negative Cache TTL (1 min)
)

@           IN  NS      ns01.auroradata.com.
@           IN  NS      ns02.datosdeaurora.org.

@           IN  MX 10   mail01.auroradata.com.
@           IN  MX 20   mail02.auroradata.com.

www         IN  CNAME   web.auroradata.com.
ftp         IN  CNAME   file.auroradata.com.

@	    IN  A       192.168.146.135
ns01        IN  A       192.168.146.132
ns02        IN  A       192.168.146.139
mail01      IN  A       192.168.146.133
mail02      IN  A       192.168.146.134
web         IN  A       192.168.146.135
file        IN  A       192.168.146.136

estacions   IN  NS  ns01.auroradata.com.
estacions   IN  NS  ns02.auroradata.com.
