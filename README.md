```
# StackNova Infra

Projet d’automatisation d’environnement de recette avec Terraform et Ansible.

---

## Prérequis

- Docker : vérifier avec `docker --version`
- Terraform : vérifier avec `terraform version`
- Ansible : vérifier avec `ansible --version`

---

##  Déploiement

Lancer le déploiement complet :

```bash
bash scripts/deploy.sh

## Questions théoriques

### Q1 — Quelle est la différence entre Terraform et Ansible ? En quoi sont-ils complémentaires ?

Terraform est un outil de provisioning qui permet de créer et gérer l’infrastructure (machines, réseaux, conteneurs).  
Ansible est un outil de configuration qui permet d’installer et configurer les services sur ces machines.  
Dans ce projet, Terraform crée le conteneur Docker, puis Ansible configure Nginx et le contenu du site web.

---

### Q2 — À quoi sert le state file Terraform ? Quels risques pose sa mauvaise gestion ?

Le state file permet de stocker l’état actuel de l’infrastructure gérée par Terraform.  
Il est utilisé pour comparer l’état réel et l’état désiré.  
Une mauvaise gestion peut entraîner des conflits, des incohérences ou la destruction accidentelle de ressources en environnement collaboratif.

---

### Q3 — Qu’est-ce que l’idempotence ? Donnez un exemple concret dans ce projet.

L’idempotence est la capacité d’un outil à produire le même résultat même si l’action est exécutée plusieurs fois.  
Dans ce projet, le playbook Ansible peut être relancé plusieurs fois sans modifier inutilement la configuration : la page HTML est simplement mise à jour avec le même contenu.

---

### Q4 — Quelle est la différence entre `terraform apply` et `terraform apply -replace` ?

`terraform apply` applique uniquement les changements nécessaires.  
`terraform apply -replace` force la suppression et la recréation d’une ressource spécifique.  
Cette option est utile en cas de problème ou de corruption d’une ressource.

---

### Q5 — Pourquoi est-il déconseillé d’utiliser le tag `latest` en production ?

Le tag `latest` peut changer dans le temps, ce qui rend les déploiements non reproductibles.  
Cela peut entraîner des comportements différents selon l’environnement ou le moment du déploiement.  
Il est donc préférable d’utiliser une version précise pour garantir la stabilité.

```
