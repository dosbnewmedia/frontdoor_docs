
# Authentifizierung

Die Authentifizierung erfolgt über OAuth2.

Zunächst muss mithilfe einer *Client ID* und eines *Client Tokens* ein *Access Token* generiert werden, der anschließend für weitere Anfragen genutzt werden kann. *Client ID* und *Client Secret* erhalten Sie von uns auf Anfrage.

**Hinweis**: Zur Zeit ist die OAuth2-Authentifizierung von splink noch unvollständig. In der Testumgebung wird empfohlen, einen *Access Token* mithilfe der Email-Adresse und des Passworts in den Query-Parametern zu erzeugen.

Da diese Vorgehensweise dem Prinzip von OAuth widerspricht, ist sie auf dem Production-System nicht vorgesehen. In Kürze wird die API erweitert, so dass OAuth-konform ein Login bei splink stattfinden muss und ein *Access Token* an eine Callback-URL zurückgeschickt wird.

## *Access Token* via Email-Adresse und Passwort

In der Testumgebung ist zur Zeit gestattet, einen *Access Token* über die direkte Übermittlung von Email-Adresse und Passwort zu generieren.

	$ curl -u 'username:password' -vd 'grant_type=password&client_id=[id]&client_secret=[secret]&username=[email]&password=[password]' 'http://api.testing.splink.de/oauth2/token

**Hinweis:** In dieser Anfrage sind zwei Zugangsdaten-Paare enthalten: Zum einen ist die [Testumgebung](/testing) mit BasicAuth vor jeglichen Zugriffen geschützt (*-u 'username:password'*). Diese Zugangsdaten erhalten Sie auf Anfrage. Weiterhin werden in den Parametern der curl-URL die Zugangsdaten des einzuloggenden Nutzers mitgegeben (*&username=[email]&password=[password]*)

Wenn *Client ID*, *Client Secret* sowie die Zugangsdaten des Nutzers korrekt sind, liefert der Server den *Access Token* sowie einen *Refresh Token* und eine Gültigkeitsdauer zurück.

	HTTP/1.1 200 OK
	{
		"access_token":"41mnuqqmix3uihzgky1uc121xsm1v6ix",
		"refresh_token":"bbahrtpaazed2vg6ikjv0mx9oz07hb7d",
		"token_type":"bearer",
		"expires_in":450000
	}

Die Gültigkeitsdauer ist die Anzahl Sekunden, die der *Access Token* ab jetzt gültig ist.

## *Access Token* via Facebook-ID und -Token

Es ist in jeder Umgebung möglich, einen User über seinen Facebook-Account bei *splink* einzuloggen. Dazu muss der folgene Request an die API geschickt werden:

	$ curl -u 'username:password' -vd 'grant_type=authorization_code&client_id=[id]&client_secret=[secret]&code=fb:[id]:[token]' 'http://api.testing.splink.de/oauth2/token

Facebook-ID und -Token werden in dem Query-Parameter *code* kombiniert. Die API nutzt bei dieseer Authentifizierung die übermittelten Daten um einen serverseitigen Facebook-Login durchzuführen. Ist dieser erfolgreich, erhält man auch hier die bereits oben beschriebenen JSON-Daten mit *Access Token*, *Refresh Token*, etc.


## Abgelaufenen *Access Token* erneuern

Mithilfe des *Refresh Tokens* der ursprünglichen Serverantwort kann ein *Access Token* erneuert werden. Dabei wird sowohl ein neuer *Access Token* als auch ein neuer *Refresh Token* generiert und zurückgeliefert, die alten Tokens werden invalidiert.

	$ curl -u 'username:password' -vd 'grant_type=password&client_id=[id]&client_secret=[secret]&refresh_token=[refresh_token]' 'http://api.testing.splink.de/oauth2/token'

Die Serverantwort ist (bei gültigen Daten) identisch zu der ursprünglichen *Access-Token*-Anfrage.


## Nutzung des *Access Tokens*

Bei allen weiteren Serveranfragen muss der zuvor generierte *Access Token* als Parameter mitgeschickt werden

	$ curl 'https://api.splink.de/events?access_token=…

In der Testumgebung sind zusätzlich die BasicAuth-Zugangsdaten erforderlich:

	$ curl -u 'username:password' 'http://api.testing.splink.de/events?access_token=…

Der *Access Token* ist an den Nutzer gebunden, dessen Zugangsdaten übermittelt wurden. Das bedeutet alle folgenden Aktionen mit diesem Token werden im Namen des Nutzers ausgeführt.

**Beispiel:** Der Autor eines Termins, der mit dem *Access Token* über die API angelegt wird, ist der Nutzer, mit dem der *Access Token* angefordert wurde.

Das bedeutet, dass über die API nur Aktionen durchgeführt werden, die dem Nutzer erlaubt sind. Das Bearbeiten eines Termins eines anderen Nutzers ist zum Beispiel nicht möglich.

