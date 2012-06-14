
# Authentifizierung

Die Authentifizierung erfolgt über OAuth2.

Zunächst muss mithilfe einer *Client ID* und eines *Client Tokens* ein *Access Token* generiert werden, der anschließend für weitere Anfragen genutzt werden kann.

**Hinweis**: Zur Zeit ist die OAuth2-Authentifizierung von splink noch unvollständig. In der Testumgebung wird empfohlen, einen *Access Token* mithilfe der Email-Adresse und des Passworts in den Query-Parametern zu erzeugen


## Access Token via Email-Adresse und Passwort

In der Testumgebung ist zur Zeit gestattet, einen *Access Token* über die direkte Übermittlung von Email-Adresse und Passwort zu generieren.

	 $ curl -u 'usr:pw' -vd 'grant_type=password&\
			client_id=[id]&client_secret=[secret]&\
			username=[email]&password=[password]' \
			'http://api.testing.splink.de/oauth2/token'

Wenn *Client ID*, *Client Secret* sowie die Zugangsdaten des Nutzers korrekt sind, liefert der Server den *Access Token* zurück:

	{
		"access_token":"41mnuqqmix3uihzgky1uc121xsm1v6ix",
		"refresh_token":"bbahrtpaazed2vg6ikjv0mx9oz07hb7d",
		"token_type":"bearer",
		"expires_in":450000
	}

## Weitere Optionen

Zur Zeit ist die einzige Möglichkeit einen *Access Token* zu generieren die direkt Übermittlung von Email-Adresse und Passwort des Nutzers.

Da diese Vorgehensweise dem Prinzip von OAuth widerspricht, ist sie auf dem Production-System nicht vorgesehen. In Kürze wird die API erweitert, so dass OAuth-konform ein Login bei splink stattfinden muss und ein *Access Token* an eine Callback-URL zurückgeliefert wird.


## Abgelaufenen Access Token erneuern

Mithilfe des *Refresh Tokens* der ursprünglichen Serverantwort kann ein *Access Token* erneuert werden. Dabei wird sowohl ein neuer *Access Token* als auch ein neuer *Refresh Token* generiert und zurückgeliefert, die alten werden invalidiert.

	$ curl -u 'usr:pw' -vd 'grant_type=password&\
			client_id=[id]&client_secret=[secret]&\
			refresh_token=[refresh_token]' \
			'http://api.testing.splink.de/oauth2/token'

Die Serverantwort ist (bei gültigen Daten) identisch zu der ursprünglichen *Access-Token*-Anfrage


## Nutzung des Access Tokens

Bei allen Serveranfragen muss der zuvor generierte *Access Token* mitgeschickt werden

	$ curl 'https://api.splink.de/events?access_token=…

In der Testumgebung sind zusätzlich die BasicAuth-Zugangsdaten erforderlich:

	$ curl -u 'usr:pw' 'http://api.testing.splink.de/\
			events?access_token=…


