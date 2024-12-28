# TFG-IaC
TFG Desplegament automatitzat i segur amb infraestructura com a codi a Azure

## :one: Resultats Execucions Terraform

![Últim Resultat Execució Terraform](https://github.com/BernatOrg/TFG-IaC/actions/workflows/execute_terraform.yml/badge.svg)


## :two: Com realitzar un desplegament a Terraform

1. Anar a la tab **Actions**
   
  ![Screenshot 2024-12-20 at 14 28 43](https://github.com/user-attachments/assets/2d356952-de67-48ab-b054-18d5901d5cd7)

2. A l'esquerra de la pàgina, seleccionar el workflow **Terraform-Azure Provisioning Manual**

  ![Screenshot 2024-12-20 at 14 28 49](https://github.com/user-attachments/assets/80e44cf8-cd21-42eb-bf02-34524c367302)

3. A la part superior dreta, premer el botó **Run workflow**

  ![Screenshot 2024-12-20 at 14 37 57](https://github.com/user-attachments/assets/59b2bfcd-3744-469f-9adf-28262da168b3)

4. Seleccionar sempre **Branch: main** i seleccionar el tipus de desplegament a realitzar

  ![Screenshot 2024-12-20 at 15 53 35](https://github.com/user-attachments/assets/d2ae96c2-def3-4ddf-a064-692946bf050e)

- **Process OK** --> Realitza tot el procés sense cap mena d'error
- **Validacio Erronia** --> Conté una errada en un dels valors d'un atribut.
- **Test Seguretat Erroni** --> Conté una configuració insegura.
- **Unit Test Erroni** --> Conté una combinació de valors en els atributs que provoca un error en els test unitaris.

## 3️⃣ Com afegir un nou tipus de recurs

1. Crear una nova carpeta dintre de la carpeta modules
2. La carpeta s'ha de dir lo més semblant al recurs (per exemple, storage_account) o definir quina agrupació de recursos conté (per exemple, networking). Finalment, ha d'acabar amb el sufix **_module**
3. Dintre de la nova carpeta, s'ha d'incloure obligatoriament, els fitxers següents:

     a. **README.md** ➡️ Informació del contingut del mòdul
   
     b. **outputs.tf** ➡️ Paràmetres de sortida que generarà el mòdul
   
     c. **[nom del recurs].tf** ➡️ Lògica de creació del recurs o recursos. Utilitzant sintaxis de Terraform.
   
     d. **variables.tf** ➡️ Variables d'entrada, s'inclouran totes les validacions necessàries.

4. En el fitxer de l'arrel **./variables.tf** afegir les variables creades en el nou mòdul.
5. En el fitxer de l'arrel **./main.tf** afegir la crida al nou mòdul, definint les variables d'entrada.
6. En el fitxer **variables/OK/terraform.tfvars** , afegir la variable creada, i els valors dels atributs que es vulgui crear.
7. Finalment, executar el flux automatitzat de GitHub Actions, per veure com Terraform proposa crear el nou recurs.

Per qualsevol dubte, es pot fer servir com a exemple, qualsevol dels 2 mòduls existents: **modules/resource_group_module** o **modules/storage_account_module**
