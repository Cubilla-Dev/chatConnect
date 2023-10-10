## Base de Datos Chat

### Chat

### user
- id_user **(PK)**
- name
- email
- password

### message   
- id_sms **(PK)**
- remitente **(FK)**
- destinatario **(FK)**
- texto
- date_sms
- hour

## Relaciones

<!-- 1. Un ***budgets*** _pertenece_ a ***registratins***
2. Un ***ant_expenses*** _pertenece_ a ***registrations*** -->