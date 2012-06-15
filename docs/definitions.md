# Definitionen

## Typ

Die Serveranfragen folgen dem REST-Prinzip, wodurch das Abfragen, Erstellen, Bearbeiten und Löschen einzelner Resource-Typen immer über das gleiche Format erfolgt.

Die folgenden Verben können genutzt werden, um mit der API zu kommunizieren:

	GET, POST, PUT, DELETE

## Datenformat

Daten werden über JSON mit der API ausgetauscht.

## Datenstruktur

Die splink-Datenbank, die über die API erreichbar ist, ist eine Graph-Datenbank. Sie besteht aus Knoten, die über Kanten miteinander verknüpft sind. Die Kanten stellen die Beziehungen der Knoten untereinander dar.

**Beispiel** Wenn ein Nutzer ein Bild *toppt*, wird in der Datenbank eine Kante vom Typ *Like* zwischen dem Knoten des Nutzers (vom Typ *User*) und dem Knoten des Bildes (vom Typ *EventPhoto* angelegt.

## IDs

Jeder Knoten und jede Kante ist über eine absolut eindeutige ID gekennzeichnet. Diese ID hat 32 Stellen und entspricht *UUID v4* ohne Bindestriche.

	c0f91fde4556482885029fdf0fe89133


# Resourcen

Die Daten der API können über verschiedene Resourcen abfragt werden, die sich für alle Resourcentypen gleich verhalten.

Die Bezeichner der Resourcen werden immer kleingeschrieben. Es ist irrelevant, ob Plural oder Singular für den Bezeichner des Resourcentyps genutzt wird.

	/resource/events
	/resource/event

## Collection Resource

Die Daten eines Resourcentypen können über die *Collection Resources* abgefragt werden. Der Pfad enthält den jeweiligen Typ:

	/resource/events

## ID Resource

Wird an die URL einer *Collection Resource* eine ID angehangen, wird eine einzelne Resource des jeweiligen Typs abgefragt.

	 /resource/events/c0f91fde4556482885029fdf0fe89133

## IDs-only Resource

Jede *Collection Resource* verfügt zusätzlich über eine Resource, die nur die IDs der Objekte des jeweiligen Typs zurückliefert. Diese ist ist erreichbar indem *_ids* an den Bezeichner in Singularform angehangen wird

	/resource/event_ids

## Top-Level Resourcen

Resourcen, die direkt über den Bezeichner hinter */resource/* erreichbar sind, werden *Top-Level Resourcen* genannt. Beispiel:

	/users
	/events

Für jede *Top-Level Resource* existiert die *Collection Resource*, die *ID Resource* sowie die *IDs-only Resource*.

## Nested Resource

Um die mit einem Objekt verbundenen Objekte zu erfragen, können *Nested Resources* genutzt werden.

	/resource/events/c0f…133/checkins
	/resource/events/c0f…133/participations

Es ist weiterhin möglich, verschachtelte *nested Resources* zu nutzen:

	 /resource/teams/c0f…133/organisations/adf…14d/clubs
