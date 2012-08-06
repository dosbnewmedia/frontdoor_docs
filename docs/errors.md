# Fehler

Bei fehlerhaften API-Anfragen werden die Fehler im folgenden Format zurückgeliefert:

	{
	  "code": 422,
	  "errors": {
	    "User": {
	      "password": ["must_not_be_empty"],
	      "first_name": ["must_not_be_empty"],
	      "gender": [{
	        "must_be_one_of": ["male", "female", "else"]
	      }]
	    }
	  }
	}
	
Das *errors*-Objekt enthält die betroffenen Resourcen (z.B. *User*) und darin die Attribute, für die Fehler festgestellt wurden. Oder aber den 
den Begriff *base*, wenn sich der Fehler nicht eindeutig einem Attribut zuordnen lässt (typisch dafür ist ein uniqueness constraint, das sich auf mehrere Attribute bezieht.)
Zum Beispiel:

	{
	  "code": 422,
	  "errors": {
	    "team_memberships": {
	      "base": [
	        {
	          "attribute_combination_must_be_unique": [
	            "user_id",
	            "team_id"
	          ]
	        }
	      ]
	    }
	  }
	}



Bei den API-Anfragen können die folgenden Fehlermeldungen zurückgegeben werden:

## must_be_one_of
Das Attribut ist nicht in der Menge der erlaubten Werte enthalten. Die Antwort liefert einen Array mit möglichen Werten zurück.

	"attribute": [{
	  "must_be_one_of": ["value1", "value2", "valueN"]
	}]

## already_taken
Das Attribut muss eindeutig sein und bereits vergeben. 

	"attribute": ["already_taken"]

## must_be_of_type
Das Attribut ist vom falschen Typ. Die Antwort liefert den erwarteten Typ zurück.

	"attribute": [{
	  "must_be_of_type": "User"
	}]
	
## must_be_longer_than
Das Attribut ist nicht lang genug. Die Antwort liefert die minimale Länge zurück.

	"attribute": [{
	  "must_be_longer_than": 8
	}]
	
## must_be_shorter_than
Das Attribut ist zu lang. Die Antwort liefert die maximale Länge zurück.

	"attribute": [{
	  "must_be_shorter_than": 256
	}]
	
## is_read_only_attribute
Das Attribut darf nicht bearbeitet werden.

	"attribute": ["is_read_only_attribute"]
	
## may_not_be_null
Das Attribut darf nicht leer bleiben.

	"attribute": ["may_not_be_null"]
	
## must_match
Das Attribut entspricht nicht dem vorgegeben regulären Ausdruck. Die Anwort liefert den regulären Ausdruck zurück

	"attribute": [{
	  "must_match": "[A-Za-z0-9!#$%\u0026\u0027*+-/\u003d?^_`{|}~]+@[A-Za-z0-9-]+(.[A-Za-z0-9-]+)*"
	}]

## must_lie_in_the_future
Das Attribut (ein Datum) muss in der Zukunft liegen.

	"attribute": ["must_lie_in_the_future"]

## must_not_be_empty
Das Attribut darf nicht leer bleiben.

	"attribute": ["must_not_be_empty"]

## must_lie_before
Das Attribut (ein Datum) muss zeitlich nach dem Datum eines anderen Attributs liegen

	"attribute": [{
	  "must_lie_before": "ends_at"
	}]

## owner_must_be_member
Der Nutzer, der zum Admin eines Teams gemacht werden soll, ist nicht Mitglied des Teams.

	"attribute": ["owner_must_be_member"]

## cannot_delete_owner
Der Admin eines Teams kann nicht aus einem Team entfernt werden.

	"attribute": ["cannot_delete_owner"]

## cannot_delete_last_owner
Der letzte Admin eines Teams kann nicht aus einem Team entfernt werden

	"attribute": ["cannot_delete_last_owner"]

## invalid_sort_key
Das Attribut kann nicht zur Sortierung genutzt werden

	"attribute": ["invalid_sort_key"]

## invalid_search_key
Das Attribut kann nicht zur Suche genutzt werden

	"attribute": ["invalid_search_key"]




















