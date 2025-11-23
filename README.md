# Hello DevOps (Python + Flask)

Ez a projekt bemutatja a DevOps alaplépéseket egy egyszerű Flask alapú "Hello World" alkalmazáson keresztül. A cél: alkalmazásfejlesztés, konténerizálás, verziókövetés és Dev Container integráció demonstrálása.

---

## 1. Alkalmazás indítása (lokálisan)

### Követelmények

- Python 3.10+
- `pip`

### Telepítés

```bash
pip install -r requirements.txt
```

### Futtatás

```bash
python app.py
```

Nyisd meg böngészőben: [http://localhost:8080](http://localhost:8080)

---

## 2.4. Dockerizálás

Az alkalmazásról készült egy Docker image, amely:

- tartalmazza a szükséges környezetet,
- induláskor automatikusan elindítja az appot,
- a konténeren belüli alkalmazás HTTP-n elérhető a `localhost:8080` címen.

### Dockerfile

```Dockerfile
FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD ["python", "app.py"]
```

### Image build parancs

```bash
docker build -t hello-devops:v1 .
```

### Konténer futtatás

```bash
docker run -p 8080:8080 hello-devops:v1
```

> Ha a 8080-as port foglalt:

```bash
docker run -p 8888:8080 hello-devops:v1
```

### Elérés

```
http://localhost:8080
```

---

## Dev Container (VS Code)

### Követelmények

- VS Code + "Dev Containers" bővítmény

### Lépések

1. Nyisd meg a projektet VS Code-ban
2. Kattints bal alsó sarokban a zöld `><` ikonra
3. Válaszd: **"Reopen in Container"**
4. A konténer indítása után:

```bash
python app.py
```

---

## Git használat

### Inicializálás

```bash
git init
git add .
git commit -m "feat: initial working app"
```

### Új feature branch létrehozása

```bash
git checkout -b feature/greet
```

Szerkeszd az `app.py` fájlt (pl. új endpoint), majd:

```bash
git add app.py
git commit -m "feat: add /greet route"
```

### GitHub távoli repo (remote) hozzáadása

```bash
git remote add origin https://github.com/<youruser>/<repo>.git
```

### Pusholás

```bash
git push -u origin main
git push origin feature/greet
```

---

## Mappa struktúra

```
hello-devops/
├── app.py
├── requirements.txt
├── Dockerfile
├── .devcontainer/
│   ├── devcontainer.json
│   └── Dockerfile (opcionális)
└── README.md
```

---

## Követelmények összefoglalása

- [x] HTTP app működik
- [x] Dockerfile működik
- [x] Konténer automatikusan elindítja az appot
- [x] App HTTP-n elérhető (localhost:8080)
- [x] Dev Container VS Code-ban működik
- [x] Git repo és legalább 1 feature branch készült
- [x] README dokumentáció tartalmaz minden lépést

---

## Készítette

DevOps alapok projekt | Python + Docker + Git + Dev Container demonstráció
