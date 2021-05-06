PImage fundo, icone, brutus_c, brutus_m1, brutus_m2, brutus_m3, brutus_rost, brutus_hit, popeeye_c, popeeye_mao, popeeye_mao2, popeeye_rosto, popeeye_hit, agua_dir, agua_esq, brutus_caind, brutus_subind, grito, olivia, olivia_chute;
//Variaveis globais jogo
int gameT = 0;
boolean pEspada = false;
int tela = 0;
int pontos = 0;
float pBonus = 0;
int tempo = 0;
int oliviat = 0;
//Variaveis globais Popeye
int posP = 4;
boolean ataqueP = false;
boolean moveP = false;
int contAP = 0;
int contMP = 0;
boolean danoP = false;
int tempP = 0;
int vidaP =0;
int passarosto;

//Função Popeye
void popeye() {
  if (tela == 1) {
    if (contAP == 30&&ataqueP==true) {
      ataqueP = false;
      contAP = -15;
    }
    if (contMP == 45) {
      moveP = false;
      contMP = 0;
    }
    if (keyPressed == true&&(moveP==false||ataqueP==false)&&danoP ==false) {
      if (key ==CODED) {
        if (keyCode == LEFT&&moveP==false&&posB<posP&&ataqueP==false&&(posP>=1&&posP<=4)) {
          posP-=1;
          moveP = true;
        } else if (keyCode == RIGHT&&moveP==false&&ataqueP==false) {
          posP+=1;
          moveP = true;
        }
        keyCode = DELETE;
      }
    } else {
      if ((key == 'a'||key=='A')&&ataqueP==false&&contAP==0&&danoP ==false&&(posP>=1&&posP<=4)) {
        ataqueP=true;
        key = 'p';
      }
    }
    if (danoP == true) {
      posP+=1;
      passarosto=0;
    } else {
      passarosto+=1;
      if (passarosto >=30) {
        image(popeeye_rosto, ((posP+1)*86+(posP-1)*78)+12, 88*3-34);
      } else 
      image(popeeye_hit, ((posP+1)*86+(posP-1)*78)+33, 88*3-64);
    }
    if (posP<=1)
      posP = 1;
    else if (posP>=5) {
      image(brutus_c, (4)*86+(3)*86-(4)*12+10, 242);
      image(brutus_rost, (4)*86+(3)*86-(4)*12+46, 212);
      tempP+=1;
      danoB = 0;
      ataqueB=0;
      tempB=0;
      if (tempP>=120) {
        moveB=false;
        posP=4;
        posB=3;
        danoB = 0;
        ataqueB=0;
        tempB=0;
        tempP=0;
        vidaP+=1;
      } else if (tempP>=59&&tempP<120)
        image(agua_dir, ((5)*86+(3)*78)+33, 88*3+54);
      else if (tempP>=1&&tempP<59) {
        image(popeeye_c, ((5)*86+(3)*78), 88*3);
        image(popeeye_hit, ((5)*86+(3)*78)+33, 88*3-64);
      }
    }
    if ((ataqueB==2&&contAB==10&&posB==posP)||(ataqueB==6&&contAB==10&&posB==posP))
      danoP = true;
    else
      danoP = false;
  }
}

//variaveis Globais do Brutus
int tempB = 0;
int posB = 3;
int tipAB = 0;
int ataqueB = 0;
boolean moveB = false;
int contAB = 0;
int contMB = 0; 
int danoB = 0;

//Função Brutus
void brutus() {
  if (tela == 1) {
    //ataqueBrutus
    if (gameT == 1&&tipAB==0) {
      if (tempB >= 121) {
        ataqueB = 1;
        tempB=0;
      }
      if (contAB == 45&&ataqueB==1) {
        ataqueB = 2;
        contAB = 0;
        tempB = 0;
      } else if (contAB == 45&&ataqueB==2) {
        ataqueB = 3;
        contAB=0;
        tempB = 0;
      } else if (contAB == 45&&ataqueB==3) {
        ataqueB = 0;
        contAB=0;
        tempB = 0;
        tipAB=1;
      }
    }
    //ataque2Brutus
    if (posB>=1&&posB<=4) {
      if (gameT == 1&&tipAB==1) {
        if (tempB >= 120) {
          ataqueB = 1;
          tempB=0;
        }
        if (contAB == 45&&ataqueB==1) {
          ataqueB = 2;
          contAB = 0;
          tempB = 0;
        } else if (contAB == 45&&ataqueB==2) {
          ataqueB = 3;
          contAB=0;
          tempB = 0;
        } else if (contAB == 45&&ataqueB==3) {
          ataqueB = 4;
          contAB=0;
          tempB = 0;
        }
        if (contAB == 35&&ataqueB==4) {
          ataqueB = 5;
          contAB = 0;
          tempB = 0;
        } else if (contAB == 35&&ataqueB==5) {
          ataqueB = 6;
          contAB=0;
          tempB = 0;
        } else if (contAB == 35&&ataqueB==6) {
          ataqueB = 7;
          contAB=0;
          tempB = 0;
        } else if (contAB == 35&&ataqueB==7) {
          ataqueB = 0;
          contAB=0;
          tempB = 0;
          tipAB=0;
        }
      }
      //ataque Gtip2
      if (gameT == 2&&tipAB==0) {
        if (tempB >= 101) {
          ataqueB = 1;
          tempB=0;
        }
        if (contAB == 35&&ataqueB==1) {
          ataqueB = 2;
          contAB = 0;
          tempB = 0;
        } else if (contAB == 35&&ataqueB==2) {
          ataqueB = 3;
          contAB=0;
          tempB = 0;
        } else if (contAB == 35&&ataqueB==3) {
          ataqueB = 0;
          contAB=0;
          tempB = 0;
          tipAB=1;
        }
      }
      //ataque2 Gt 2Brutus
      if (posB>=1&&posB<=4) {
        if (gameT == 2&&tipAB==1) {
          if (tempB >= 100) {
            ataqueB = 1;
            tempB=0;
          }
          if (contAB == 35&&ataqueB==1) {
            ataqueB = 2;
            contAB = 0;
            tempB = 0;
          } else if (contAB == 35&&ataqueB==2) {
            ataqueB = 3;
            contAB=0;
            tempB = 0;
          } else if (contAB == 35&&ataqueB==3) {
            ataqueB = 4;
            contAB=0;
            tempB = 0;
          }
          if (contAB == 25&&ataqueB==4) {
            ataqueB = 5;
            contAB = 0;
            tempB = 0;
          } else if (contAB == 25&&ataqueB==5) {
            ataqueB = 6;
            contAB=0;
            tempB = 0;
          } else if (contAB == 25&&ataqueB==6) {
            ataqueB = 7;
            contAB=0;
            tempB = 0;
          } else if (contAB == 25&&ataqueB==7) {
            ataqueB = 0;
            contAB=0;
            tempB = 0;
            tipAB=0;
          }
        }
      }
      //movimentoBrutus
      if (contMB == 60) {
        moveB = false;
        contMB = 0;
      }
      if (posP-posB!=1&&(posP>posB)&&moveB==false&&(ataqueP == true && posP == posB&&contAP==10)==false&&(posB<=4)) {
        posB +=1;
        moveB = true;
      } else if (posP-posB==1&&(posP>posB)&&moveB==false&&(ataqueP == true && posP == posB&&contAP==10)==false&&contMP==0&&(posB<=4)) {
        posB +=1;
        moveB = true;
      } 
      if (danoB == 2) {
        danoB = 0;
        posB-=1;
        contMB = -30;
        moveB = true;
      }
      if (contMB>=-30&&contMB<0)
        image(brutus_hit, (posB)*86+(posB-1)*86-(posB)*12-5, 188);
      else
        image(brutus_rost, (posB)*86+(posB-1)*86-(posB)*12+46, 212);
      //tempo e danoBrutus
      if (ataqueP == true && posP == posB&&contAP==10) {
        danoB+=1;
        pontos+=1;
        pBonus+=0.5;
      }
      tempB+=1;
    } else {
      danoB = 0;
      ataqueB=0;
      ataqueP=true;
      moveP=true;
      posB=-1;
      if (posB<=0&&tempB==120) {
        if (posLatinha == -1)
          posLatinha=0;
        else if (posLatinha == 0)
          posLatinha=3;
        else if (posLatinha == 1)
          posLatinha=4;
        else if (posLatinha == 2)
          posLatinha=5;
        posB=3;
        posP=4;
        ataqueP=false;
        moveP=false;
        contMP=0;
        contMB=0;
        contAP=0;
        contAB=0;
        ataqueB = 0;
        tempB=0;
        pontos+=int(pBonus);
        pBonus=0;
      }
      if (posB<=0&&tempB>=30&&tempB<60) {
        image(brutus_caind, (0)*86+(0-1)*86-(0)*12+46, 212);
      } else if (posB<=0&&tempB>=60&&tempB<90) {
        image(agua_esq, 10, 88*3+40);
      } else if (posB<=0&&tempB>=90&&tempB<120) {
        image(brutus_subind, 48, 88*3+11);
      }
      tempB+=1;
    }
  }
}
int posLatinha = -1;
int framesLatinha = 0;
void desenha() {
  if (tela == 1) {
    //fixo
    image(fundo, 0, 0);

    //Latinha Esp e contato
    fill(111);
    if (posLatinha == 3) {
      rect(335, 80, 30, 30);
      framesLatinha+=1;
      if (framesLatinha ==30) {
        posLatinha = 1;
        framesLatinha=0;
      }
    } else if (posLatinha == 4) {
      rect(265, 80, 30, 30);
      framesLatinha+=1;
      if (framesLatinha ==30) {
        posLatinha = 2;
        framesLatinha=0;
      }
    } else if (posLatinha == 5) {
      rect(250, 30, 30, 30);
      framesLatinha+=1;
      if (framesLatinha ==60) {
        posLatinha = 6;
        framesLatinha=0;
      }
    } else if (posLatinha == 6) {
      rect(220, 150, 30, 30);
      framesLatinha+=1;
      if (framesLatinha ==60) {
        posLatinha = 7;
        framesLatinha=0;
      }
    } else if (posLatinha == 7) {
      rect(200, 160, 30, 30);
      framesLatinha+=1;
      if (framesLatinha ==60) {
        posLatinha = 8;
        framesLatinha=0;
      }
    } else if (posLatinha == 8) {
      rect(190, 180, 30, 30);
      framesLatinha+=1;
      if (framesLatinha ==60) {
        posLatinha = 9;
        framesLatinha=0;
      }
    } else if (posLatinha == 9&&posP==1) {
      rect(190, 200, 30, 30);
      framesLatinha+=1;
      if (framesLatinha ==240) {
        posLatinha = 10;
        framesLatinha=0;
      }
      tela = 4;
    } else if (posLatinha == 9&&posP!=1) {
      rect(200, 200, 30, 30);
      framesLatinha+=1;
      if (framesLatinha ==60) {
        posLatinha = 0;
        framesLatinha=0;
      }
    }
    if (posLatinha==0||posLatinha==2||posLatinha==1)
      rect(273+(posLatinha*15+32*posLatinha+1), 114, 24, 27);
    //Brutus
    fill(255);
    if (posB>=1&&posB<=4)
      image(brutus_c, (posB)*86+(posB-1)*86-(posB)*12+10, 242);
    if (moveB == true)
      contMB+=1;
    if (ataqueB>=1)
      contAB+=1;
    //popeye
    if (posP>=1&&posP<=4)
      image(popeeye_c, ((posP+1)*86+(posP-1)*78), 88*3);
    if (moveP == true)
      contMP+=1;
    if (ataqueP==true||contAP<0)
      contAP+=1;
    //ataquepopeye
    fill(255);
    if (posP>=0&&posP<=4) {
      if (ataqueP == true&&posB>=0&&(posP>=0&&posP<=4))
        image(popeeye_mao2, 160*posP-6, 240);
      else
        image(popeeye_mao, 160*posP+25, 272);
    }
    //ataqueBrutus
    if (posB>=1&&posB<=4) {
      if (ataqueB == 2||ataqueB==6)
        image(brutus_m3, (160*posB)-10, 228);
      else if (ataqueB == 1||ataqueB==3||ataqueB==5||ataqueB==7)
        image(brutus_m2, (160*posB)-80, 212);
      else
        image(brutus_m1, (160*posB)-84, 243);
    }
    if (vidaP == 1)
      image(icone, 600, 0);
    else if (vidaP == 2) {
      image(icone, 600, 0);
      image(icone, 650, 0);
    } 
    //olivia
    if (tela == 1&&tempo%120==0&&posLatinha<4)
      oliviat = 1;
    else if (tela == 1&&tempo%60==0&&posLatinha<4)
      oliviat = 0;   
    if (oliviat ==1&&tela==1)
      image(grito, 390, 17);
    else if (oliviat ==0&&tela==1)
      image(olivia, 395, 69);
    else if (tela==1&&posLatinha>=4&&posLatinha<=5)
      image(olivia_chute, 390, 69);

    //peixe espada
    if (tela==1&&gameT==2&&(posP>=0&&posP<=3&&posB>0)) {
      if (tempo%240==0&&tempo%480!=0){
        if (tempP>=0&&tempP<=60){
        rect(700, 300, 60, 60);
        }
        tempP+=1;
      }
      else if (tempo%480==0){
      if (tempP>=0&&tempP<=60){
        rect(700, 300, 60, 60);
        pEspada = true;
        tempP+=1;
        }
        tempP+=1;
      }
      if(tempP>60)
        tempP = 0;
     }
   //animação de vitória
  }
  if (tela == 4) {
    image(icone, 600, 0);
    image(icone, 650, 0);
    image(icone, 700, 0);
    image(fundo, 0, 0);
    image(brutus_c, (3)*86+(3-1)*86-(3)*12+10, 242);
    image(brutus_rost, 442, 212);
    if (tempo%180==0)
      tela = 0;
  }
  if (tela == 3) {
  }
}

//controle do jogo total
void jogo() {
  if ((vidaP!=3&&(tela==1||tela==3||tela==4))||tempo==18000) {
    desenha();
    popeye();
    brutus();
    tempo+=1;
  } else if (vidaP==3&&tela==1) {
    tela=4;
    vidaP=0;
    pontos = 0;
    pBonus = 0;
  }
  if (tela==0) {
    textSize(48);
    text("GAME A", 20, 140);
    text("GAME B", 20, 240);
    rect(250, 100, 50, 50);
    rect(250, 200, 50, 50);
    if (mouseX>=250&&mouseX<=300&&mouseY>=100&&mouseY<=150) {
      fill(140, 100, 100);
      rect(250, 100, 50, 50);
      fill(255);
    } else if (mouseX>=250&&mouseX<=300&&mouseY>=200&&mouseY<=250) {
      fill(140, 100, 100);
      rect(250, 200, 50, 50);
      fill(255);
    }      
    if (mouseX>=250&&mouseX<=300&&mouseY>=100&&mouseY<=150&&(mousePressed == true&&mouseButton==LEFT)) {
      tela=1;
      gameT=1;
    } else if (mouseX>=250&&mouseX<=300&&mouseY>=200&&mouseY<=250&&(mousePressed == true&&mouseButton==LEFT)) {
      tela=1;
      gameT=2;
    }
  }
}
//segunda execução
void setup() {
  background(0);
  fundo = loadImage("./fundo.png");
  icone = loadImage("./icone_vida.png");
  brutus_c = loadImage("./brutus_corpo.png");
  brutus_m1 = loadImage("./brutus_mao.png");
  brutus_m2 = loadImage("./brutus_mao2.png");
  brutus_m3 = loadImage("./brutus_mao3.png");
  brutus_rost = loadImage("./brutus_rosto.png");
  brutus_hit =loadImage("./brutus_hit.png");
  popeeye_c = loadImage("./popeeye_c.png");
  popeeye_mao = loadImage("./popeeye_mao.png");
  popeeye_mao2 = loadImage("./popeeye_mao2.png");
  popeeye_rosto = loadImage("./popeeye_rosto.png");
  popeeye_hit = loadImage("./popeeye_hit.png");
  agua_dir = loadImage("./agua_dir.png");
  agua_esq = loadImage("./agua_esq.png");
  brutus_caind = loadImage("./brutus_caind.png");
  brutus_subind = loadImage("./brutus_subind.png");
  grito = loadImage("./grito.png");
  olivia = loadImage("./olivia.png");
  olivia_chute = loadImage("./olivia_chute.png");
  size(748, 396);
}
//terceira em diante
void draw() {
  background(0);
  jogo();
}
