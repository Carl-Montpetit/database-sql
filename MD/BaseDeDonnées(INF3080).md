# Base de données (INF3080) 

---

## Cours 1 

---

![image-20210512140615611](/home/carl_xyz/snap/typora/36/.config/Typora/typora-user-images/image-20210512140615611.png)

---

### Plan du cours

---

- Les bases de données sont <u>partout</u> dans les entreprises
  - Le plus tôt on apprend le mieux c’est pour notre carrière
- Les enregistrements sont pas toujours accessibles $\rightarrow$ on doit <u>être présent au cours</u>
- Les labos commencent lundi prochain
- <u>Livres optionnel</u> voir plan de cours
- Suivre le cours de Udemy aussi si possible
- Le fonctionnement de SQL n’a pas changé depuis longtemps $\rightarrow$ beaucoup d’application ont été développés sur ces fonctionnements
- Télécharger la machine virtuelle  ou autres ressources, mais <u>maîtriser avec Oracle</u> avant
- On peut travailler avec le serveur Uqam ou pas
- On est évaluer sur <u>Oracle</u> dans le cours
- Télécharger la base de donnée tôt le matin ou dans la nuit avec un ordinateur performant (le mac ou le pc)
- <u>Linux est plus stable que Windows</u> pour les bases de données
- debay.georges@uqam.ca : courriel du prof
- Il répond au question durant le cours $\rightarrow$ Limite le nombre de courriel car très occupé
- Les powerpoints sont sur la page moodle 

---

### Les évaluations :

---

<img src="/home/carl_xyz/snap/typora/36/.config/Typora/typora-user-images/image-20210512140228817.png" alt="image-20210512140228817" style="zoom: 80%;" />

<img src="/home/carl_xyz/snap/typora/36/.config/Typora/typora-user-images/image-20210512140319726.png" alt="image-20210512140319726" style="zoom:80%;" />

---

### Chapitre 1

---

#### En bref

<img src="/home/carl_xyz/snap/typora/36/.config/Typora/typora-user-images/image-20210512150908721.png" alt="image-20210512150908721" style="zoom:200%;" />

#### Introduction :

- <u>Tout est stocké</u> dans les bases de données 

  - Systèmes d’information de gestion
  - Ingénierie
  - Contrôle de processus
  - Bibliothèques électroniques
  - Passwords manager
  - $...$ 

  #### Il peut y avoir des <u>pertes de données</u>

  - Ex :  Desjardins. garderie (nouvelles), etc…

  #### Les différences entre bases de données et Excel :

  - Ex : Pas de droit pour l’accès sur certaines colonnes dans Excel
  - Multi-user (travailler en même temps) n’est pas aussi rapide dans Excel 
    - Ex : Kijiji vs Excel si trop de gens en même temps ça va planter !

  #### Une base de données est comme une seule page Excel :

  - Avec des fonctionnalités beaucoup plus avancé
  - La fiabilité est importante

  ---

  ### SGBD 

  ---

  - Access (pas beaucoup de données)
  - Oracle, mySQL : grande base de données (10 Gb et plus)
  - Oracle est très dispendieux ($$$$) = la Cadillac ou tesla 
  - Données persistantes = sont là et vont rester là  
    - Commit et roleback

  ---

  ### Donnée (data)

  ---

  - Représentation d’un fait stocké en mémoire (avec la représentation binaire)

  #### Type de données :

  - La nature du codage  utilisé pour représenter la donnée et les opérations applicables à la donnée
    - Donnée simple 
      - Ex : adresse d’une personne
    - Donnée complexe
      - Composée de données simples 
        - Ex : adresse d’une personne avec  autre chose
    - Donnée multimédia (multimédia data)
      - Texte, image, son, vidéo, …
      - Avantage : 
        - Tout est regroupé dans le même endroit
      - Désavantage :
        - Très volumineuses 
    - On est met les images et vidéos hors de la base de donnée 
      - C’est une meilleure pratique

  #### Base de données relationnelles :

  - Relation entre les entités 
  - Créer des tables avec des relations entre-elles 
    - pas de redondances dans les données 

  #### Une base de données :

  1. Au sens large, une collection de données

  - Ex :

    - Fichier texte 
      - Désavantage :
      - On commence toujours du début 

    - Ensemble de fichiers texte
      - Avantage :
        - On se déplace plus facilement pour chercher
        - On ne parcours pas un par un

    - Un seul fichier d’enregistrement

    - Ensemble de fichiers d’enregistrement

    - Plusieurs sous bases de données indépendantes les une des autres

    - Toile : base de données de nature hétérogène et répartie

    - BD logique = une collection de BD physiques

  2. Fortement structurées
  3. persistantes
  4. structure définie dans un schéma 
  5. gérées par le système de gestion de bases données 



#### Un serveur vs un ordinateur

- Un ordinateur est souvent plus cher qu’un serveur

- Parfois on veut le serveur directement sur place mais très dispendieux 
- Un seul disque (souvent) dans un ordinateur 
- Un disque dur a une durée de vie variable en avoir plus aide à la stabilité
  - Ex : si le disque dur de l’ordinateur meurt on est foutu 
  - Ex : Dans un serveur il a plusieurs disque de backup

#### Disque dur vs SSD

- Changer pour SSD Samsung EVO est la première solution pour augmenter la vitesse d’un ordinateur
- Ce qui coûte le plus cher
  - 2 Tb = 1 600 \$ 
- Si ça lag c’est la première chose à changer 

#### Serveurs

- HP et DELL sont de bons serveurs pour le prix
- La mémoire est le plus importante
- Ça peut devenir très chaud 

#### On continue le chapitre 1 au prochain cours

- On doit avoir accès à la base données sur Oracle

- Pour le premier labo :

  - On se connecte en ssh :

  - Pour info voir : https://wiki.uqam.ca/display/SWS/labunix
    1. ssh codeMs@zeta2.labunix.uqam.ca (à la console)
    2. même mot de passe que moodle (pin de 6 caractères)
    3. On va chercher : oracle.txt 

---

## Cours  2

### Processus de conception de BD

![image-20210531093839727](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531093839727.png)

1. Cycle de vie en cascade 
2. Cycle de vie itératif
3. …

### Planification

- **Pourquoi** développer un système ?

- 
- Étude d’opportunité
  - Risques
  - Coûts
  - Bénéfices
- Document des exigences logicielles
  - Spécification de haut niveau du système
  - Diagramme de contexte
    - UML : diagramme des cas d’utilisation

#### Études de cas : SyLeRat :

- Développement d’un système d’information pour la bibliothèque *LeRat*
  - Gestion des collections
  - Service de prêt
  - Suivi des retards
  - Service de repérage documentaire
  - Alimenté par *SystèmeAcquisitions*

#### Acteurs et cas d’utilisation :

- Cas d’utilisation (use cases) Jacobson (92)	

  - Interface au système d’un point de vue de son utilisation par acteurs

- Acteur :

  - Entité externe qui interagit avec le système

  #### Diagramme de contexte de SyLerat :

![image-20210531100928488](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531100928488.png)

- Exemple : Documentation d’accompagnement pour le cas d’utilisation GérerPrêt

  - > **Nom :** GérerPrêts
    >
    > **Description courte :** Gérer les prêts
    >
    > **Type :** Interactif
    >
    > **Description :**  
    >
    > Ce cas d’utilisation est déclenché par le commis au prêt suite à une requête d’un membre ou d’un employé. Il lui permet d’enregistrer un prêt ou un retour, de consulter les prêts, de gérer les données d’identification des membres, i.e l’identificateur d’utilisateur de sa carte de membre, le mot de passe du membre, son nom, prénom et le numéro de téléphone de sa résidence. Il permet aussi de produire un rapport des retards. Lors d’un prêt ou d’un retour, l’identificateur d’utilisateur et l’identificateur de l’exemplaire peuvent être saisis en utilisant un lecteur optique ou manuellement.
    >
    > **Règles du domaine d’application :** 
    >
    > 1. La durée maximale d’un prêt est fixée à 7 jours pour un membre
    > 2. Le nombre maximal d’emprunts est fixé à cinq pour un membre
    > 3. Il est interdit d’effectuer un prêt lorsqu’un membre a un retard
    > 4. Les contraintes précédentes ne s’appliquent pas aux emprunts effectués par les employés
    >
    > **Exigence de performance :** 
    >
    > - Le temps d’attente de la validation de l’identificateur de l’utilisateur et de la vérification des conditions requises pour un emprunt doit être inférieur à 1 seconde
    >
    > **Exigence de sécurité :**
    >
    > - Le commis doit être autorisé à l’aide de son identificateur d’utilisateur et de son mot de passe

### Analyse : modèle conceptuel de données

**Modèle conceptuel de données :** 

- Représentation abstraite des informations à placer dans la base de données qui est indépendante de la technologie utilisée pour l’implémentation
- Données persistantes du *Platform Independent Model (PIM)* de *Model Driven Architecture (MDA* de l’OMG

#### Représentation du modèle conceptuel :

- Formalisme entité/association (Chen, 76)
  - Diverses extensions
- Modèles sémantiques
  - Graphes conceptuels (Sowa), SDM, …
- UML
  - Entité/association++
  - Diagramme de structure statique (diagrammes de classes)

### Diagrammes de classes UML 

![image-20210531102802356](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531102802356.png)

#### Notion d’objet et de classe :

- Objet (instance d’une classe)
  - Significatif pour le domaine d’application
  - Caractérisé par
    - Identité
    - État
    - Comportement
- Attribut (variable membre, variable d’instance)
  - Contenant pour une valeur
  - État

#### Représentation d’un objet en UML :

![image-20210531103102236](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531103102236.png)

#### Classe :

- Abstraction
- Caractéristiques communes à un ensemble d’objets
  - Attributs
  - Associations
  - Opérations

#### Intension/extension :

- Intension (intent) d’une classe
  - Propriété commune (attributs, associations et opérations)
- Extension (extent) d’une classe 
  - Ensemble des objets correspondant à la classe
    - Extension représentée par un objet ?

#### Terminologie :

- Objet
  - Instance, occurrence, entité
- Classe à l’analyse
  - Abstraction
  - Pas toujours une classe d’implémentation
  - Concept, entité, type (stéréotype UML)
  - Stéréotype “entité” pour données persistantes du domaine d’application
  - Valeur étiqueté (persistent)

#### Stéréotype UML :

![image-20210531103747343](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531103747343.png)

#### Identifiant d’objet (OID, object identifier) :

- Mécanisme d’identification
  - Pas deux objets avec le même OID
- Implicite
  - Non visible
  - Réalisation traitée à la conception
- Mécanisme de référence

#### Pas besoin d’identificateur explicite ! :

- Par opposition au relationnel 

![image-20210531104102341](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531104102341.png)

#### Identifiant naturel (ou clé ‘key’ ) pour une classe :

- Ensemble d’attributs minimal qui identifie chacun des objets de manière unique 
  - clé candidate du relationnel
- Représentation par une contrainte UML

![image-20210531104344918](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531104344918.png)

#### Syntaxe générale pour la spécification des attributs en UML :

- [visibilité] nom [multiplicité] [:type] [=valeurInitale] [{propriétés}]

![image-20210531104700840](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531104700840.png)

![image-20210531104820437](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531104820437.png)

### Notion de lien et d’association binaire :

![image-20210531105427112](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531105427112.png)

#### Rôles et multiplicités :

![image-20210531124614269](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531124614269.png)

#### Association réflexive :

![image-20210531124651276](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531124651276.png)

#### Contraintes pré-définies pour les associations :

- Ordonné (ordered)
- Modifiable (changeable)
- InsertionSeulement (addOnly)
- Fixe (frozen)
- Exclusives
  - Entre deux associations

### Agrégation

- Cas particulier d’association

![image-20210531124956071](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531124956071.png)

#### Composition :

![image-20210531125036304](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531125036304.png)

#### Associations qualifiées :

![image-20210531125142555](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531125142555.png)

#### Classes associatives :

![image-20210531125233789](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531125233789.png)

#### Autre solution : Classe associative + agrégation

![image-20210531125354755](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531125354755.png)

#### Solution avec la classe Groupe :

![image-20210531125436477](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531125436477.png)

### La généralisation / spécialisation 

![image-20210531125535283](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531125535283.png)

#### Notation multi-segments :

![image-20210531125621291](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531125621291.png)

#### Mise en facteur par délégation :

![image-20210531125713571](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531125713571.png)

#### Discriminant :

![image-20210531125750810](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531125750810.png)

### Contraintes pré-définies pour la généralisation

![image-20210531125856586](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531125856586.png)

#### Notation alternative par une note UML :

![image-20210531125934961](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531125934961.png)

### Héritage Multiple 

![image-20210531130156444](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531130156444.png)

#### Multi-classification et héritage multiple :

![image-20210531130456430](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531130456430.png)

#### Modélisation par rôle :

![image-20210531130549460](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531130549460.png)

### Attribut de classe 

![image-20210531130636218](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531130636218.png)

#### Opérations :

![image-20210531130726517](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531130726517.png)

#### Syntaxe générale pour la spécification des opérations en UML :

![image-20210531130853018](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531130853018.png)

#### Syntaxe pour les opérations (suite) :

![image-20210531130945222](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531130945222.png)

#### Interface :

![image-20210531131015271](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531131015271.png)

#### Définitions :

![image-20210531131046469](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531131046469.png)

### Spécification de contraintes

- Entre `{}` 
- À proximité de l’élément concerné
  - Après spécification d’un attribut
  - Avant un ensemble d’attributs
- Note reliée aux éléments
- Près d’un trait pointillé
- Près d’une flèche pointillée
- Syntaxe
  - Langue naturelle
  - OCL (version 1.1 d’UML)

### Éléments dérivés :

![image-20210531131506658](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531131506658.png)

### Modèle entité-association : ERD de Oracle Designer

![image-20210531131619826](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531131619826.png)

#### Notation des multiplicités :

![image-20210531131648220](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210531131648220.png)









---

### Environnement SGBD

<img src="/home/carl_xyz/snap/typora/37/.config/Typora/typora-user-images/image-20210519134606697.png" alt="image-20210519134606697" style="zoom:200%;" />

#### Langage de manipulation de données et de requête :

- Manipulation des données
  - Lire (sélectionner)
  - Ajouter
  - Supprimer
  - Modifier

- Langage de manipulation des données (LMD, data manipulation language - DML)
  - Langage de requête (query language)
  - Ex : **SQL**, OQL

#### Contexte d’utilisation du LMD :

- Langage de manipulation des données enchâssé (embedded data manipulation language), langage hôte (host language)
  - LMD enchâssé un langage de programmation hôte
    - (C, C++, ADA, Java, …)
  - Syntaxe spéciale non reconnue par compilateur
    - Étape de pré-compilation
  
- Interface programmatique (API)
  - ODGB, JDBC
  
- Utilitaire GUI convivial

- Évaluateur de requête (query precessor)

  - composante du SGBD responsable  de l’exécution des requêtes
  - Processus complexe

- Requête (query)

  - Opération de manipulation de donnée

  ## Cours 3
  
  ### TP1
  
  entités :
  
  - client
    - num
    - adresse
    - etc
  - voiture
    - num serie (cle quandidate ou primaire)
    - année
    - date
    - modele
    - etc
  - police d’assurance
    - une ou plusieurs voiture
  - accident
    - date d’accident
    - lieu d’accident
    - etc
  - Paiment
    - premier versement
    - date
    - deuxieme paiement
    - etc
  - on peut ajouter ce qu’on veut pour nous aider
  
  ![image-20210602152754469](/home/carl_xyz/snap/typora/38/.config/Typora/typora-user-images/image-20210602152754469.png)

