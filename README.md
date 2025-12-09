# ShellFire
**Version:** Beta_001  
A docker-powered Red/Blue simulation exercise  

## Welcome To Shell ##
I've made this program mostly as a test to myself. I wanted to deep dive into Docker with a project. The goal is to create a Red Team vs Blue Team simulation battleground that could be spun up and torn down really quickly. I have no prior experience with Docker, so we're going to see where this goes.  
Right now, the project is in beta, it probably won't work for a while, but I plan to finish the Zero-Skill 7v7 mode before Q2 of 2026.

## How to Use ##
1. Download the Repo  
2. Run the dockerfile  
  `docker compose up --build`  
3. Once built, connect to a player machine on localhost ports    
  Red Team: 8101 - 8107  
  Blue Team: 8001 - 8007  
  Password for all vnc sessions is "kali"  

## Goals for the Project ##

**POC 1v1**
- [ ] Create a 1v1 Proof of Concept with an Attacker, Defender, DMZ system, and Database
- [X] Run the Attacker and Defender machines with VNC or something similar so that anyone can play from browser
- [ ] Create a Zero-Skill mode and a Live fire mode.
  - [ ] Zero skill will play like a choose-your-own-adventure
  - [ ] Live fire requires actual tools and exploits

**Scaling**
- [ ] Introduce player roles up to 7v7
- [ ] GameMaster to control teams
- [ ] Create more DB and DMZ Systems
- [ ] Implement Scoring

**Personal Goals**
- [ ] Learn Docker and Docker Compose
- [ ] Learn about configuring DMZ systems
- [ ] Learn about databases
- [ ] Learn about logging systems
- [ ] Learn APIs
- [ ] Learn some front end and back end development

## Timeline ##
Beta_001: Create Docker Compose file that spins up an Attacker, Defender, Dummy Server, and Dummy Web Page
