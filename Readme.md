<h1 align="center"> Cyber HIT project - traps for attackers on services </h1>


## Commands (without docker)
#### Services
```
HTTP  ->  python -m uvicorn main:app --reload 
FTP   ->
SMTP  ->
RDP   ->
```
#### API
```

```
#### Docker
```
Run     -> docker compose up
Stop    -> docker compose down
Testing -> 
```

## Routing
```
API:          :5000
GUI:          :5001
Services -
  HTTP:       :8080
  FTP:        :21
  SMTP:       :25
  RDP:        :3389
```

## Roadmap
- [ ] Backend (API)
- [ ] Frontend (Client)
  - [ ] Login page
  - [ ] Report page
  - [ ] profile page
  - [ ] Admin page
- [ ] DB (MySQL)
  - [ ] Design
  - [ ] Init table
- [ ] Services
  - [ ] HTTP
    - [x] Client
    - [x] API
    - [ ] Traps
  - [ ] FTP
    - [ ] Client
    - [ ] API
    - [ ] Traps
  - [ ] SMTP
    - [ ] Client
    - [ ] API
    - [ ] Traps
  - [ ] RDP
    - [ ] Client
    - [ ] API
    - [ ] Traps
- [ ] Logger
