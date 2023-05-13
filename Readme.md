<h1 align="center"> Cyber HIT project - traps for attackers on services </h1>


## Commands (without docker)
#### Services
```
HTTP  ->  python -m uvicorn main:app --reload 
FTP   ->  python main.py
SMTP  ->  python main.py
SSH   ->  python main.py
```

## Docker Command
```
Run     -> docker compose up
Stop    -> docker compose down
```

#### Testing
` ./tests/ python -m pytest `

## Documentation
- Documentation API: `localhost:5000/docs`

## Routing
```
API:          :5000
GUI:          :5001
Services -
  HTTP:       :8080
  FTP:        :2121
  SMTP:       :2525
  SSH:        :2222
```

## DB Diagram
<img src="./assets/sqlmodel.png"/>

## Roadmap
- [ ] Backend (API)
  - [ ] config
  - [ ] models
  - [ ] routes
    - [ ] user
    - [ ] auth
    - [ ] report
    - [ ] logger
  - [ ] schemas
- [ ] Frontend (Client)
  - [ ] Login page
  - [ ] Report page
  - [ ] profile page
  - [ ] Admin page
- [ ] DB (MySQL)
  - [x] Design
  - [x] Init table
- [ ] Services
  - [ ] HTTP
    - [x] Client
    - [x] API
    - [x] Traps
  - [ ] FTP
    - [x] Server
    - [ ] Traps
  - [ ] SMTP
    - [x] Server
    - [ ] Traps
  - [ ] SSH
    - [x] Server
    - [ ] Traps
- [ ] Testing

## Team
> <a href="https://github.com/mfrankii"><kbd><img src="https://avatars.githubusercontent.com/u/88384146?s=30"/></kbd></a> &nbsp; Moshe Frankipour
>
> [Github](https://github.com/mfrankii) | [LinkedIn](https://www.linkedin.com/in/moshe-frank/) 

> <a href="https://github.com/PeriAmiga"><kbd><img src=""/></kbd></a> &nbsp; Peri Amiga
>
> [Github](https://github.com/PeriAmiga) | [LinkedIn](https://www.linkedin.com/in/peri-amiga-294815246/) 

> <a href="https://github.com/tomerIdan"><kbd><img src="https://avatars.githubusercontent.com/u/105118970?s=30"/></kbd></a> &nbsp; Tomer Idan
>
> [Github](https://github.com/tomerIdan) | [LinkedIn](https://www.linkedin.com/in/tomer-idan-38015b22b/) 
