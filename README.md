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

  ![Screenshot 2024-12-20 at 14 28 39](https://github.com/user-attachments/assets/e30d487c-ec04-4edc-a2e5-f8541e262b8c)

- **Process OK** --> Realitza tot el procés sense cap mena d'error
- **Validacio Erronia** --> Conté una errada en un dels valors d'un atribut.
- **Test Seguretat Erroni** --> Conté una configuració insegura.
- **Unit Test Erroni** --> Conté una combinació de valors en els atributs que provoca un error en els test unitaris.

