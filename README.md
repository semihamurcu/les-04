# Opdracht 1 – Ansible Roles met Webserver en Database Setup

In deze opdracht zijn twee VM's geconfigureerd via een Ansible-playbook. Eén VM fungeert als webserver (met Apache, PHP en PHP-MySQL), de andere als databaseserver (MySQL). Hostnamen en IP-adressen worden automatisch toegevoegd aan een inventory-bestand. Rollen zijn opgesplitst in Ansible roles met gebruik van handlers en variabelen (group_vars, inventory variabelen en playbook variabelen).

## Bron

https://chatgpt.com/share/682ec4ed-40bc-8002-ac3d-00949e656a4a


## Wat is gerealiseerd?

- **Deploy 2 VM’s** via Terraform:  
  - `webserver` als webserver  
  - `databaseserver` als databaseserver

- **Inventory bestand** wordt automatisch gegenereerd met hostnamen en IP-adressen, duidelijk gescheiden in groepen `[web]` en `[db]`.

- **Ansible roles** zijn aangemaakt om:  
  - Apache, PHP en PHP-MySQL te installeren op de webserver VM  
  - MySQL te installeren en configureren op de database VM

- **Gebruik van variabelen**:  
  - Inventory variabelen in `inventory.ini`  
  - Group variables in `group_vars/web.yml` en `group_vars/db.yml`  
  - Variabelen in het playbook (`site.yml`)

- **Handlers** zorgen ervoor dat services als Apache en MySQL netjes herstarten bij configuratiewijzigingen.

- **MySQL user** `dbuser` met wachtwoord `dbpassword` is aangemaakt en kan gebruikt worden voor inloggen op de database.

## 📁 Bestanden

| Bestand/folder       | Functie                                        |
|----------------------|------------------------------------------------|
| `inventory.ini`      | Inventory met webserver en databaseserver     |
| `group_vars/`        | Variabelen per groep (web / db)               |
| `roles/web/`         | Apache, PHP, PHP-MySQL installatie            |
| `roles/db/`          | MySQL installatie en user configuratie        |
| `site.yml`           | Hoofd-playbook waarin de roles worden gebruikt|

## 🚀 Deploy & Configure

1. Deploy VM's via Terraform (`terraform apply`).
2. Run Ansible playbook met `ansible-playbook -i inventory.ini site.yml`.
3. Je hebt een werkende webserver en database met correcte gebruikersrechten.

---

## Aantoning van deployment

De mp4 laat een raw footage zien:
* Dat de vm's deployt worden genaamd webserver en databaseserver.
* Inventory met duidelijke naamgeving om welke server het gaat.
* Rollen worden via ansible playbook uitgerold.
* je kunt inloggen op de mysql server 