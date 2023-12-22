color col(float x, float y, float u ,float v)
{
 float d=dist(x,y,u,v);
  if(d<=(width*20)/100)
  {
    return color(255,0,0);
  }
  else if((d>(width*10)/100)&&(d<=(width*40)/100))
  {
    return color(251, 121, 35);
  }
  else if((d>(width*30)/100)&&(d<=(width*60)/100))
  {
    return color(255, 209, 0);
  }
  else
  {
    return color(0,255,0);
  }
}
PVector pos()
{  
    int rand;
    PVector p=new PVector(0,0);;
    rand=int(random(4));
    if(rand==0)
    {
      p=new PVector(random(width),0);
    }
    else if(rand==1)
    {
      p=new PVector(0,random(height));
    }
    else if(rand==2)
    {
      p=new PVector(random(width),height);
    }
    else if(rand==3)
    {
      p=new PVector(width,random(height));
    } 
     return p;
}  
int num=50;
PVector[] Np=new PVector[num];
void setup()
{
  size(600,600);
  for(int i=0;i<num;i++)
  {
   Np[i]=new PVector(random(width),random(height));
  }
}
void draw()
{
  background(0);
  for(int i=0;i<num;i++)
  {
    fill(col(mouseX,mouseY,Np[i].x,Np[i].y));
    ellipse(Np[i].x,Np[i].y,40,40);
    if(Np[i].x<mouseX)
    {
      Np[i].x++;
    }
    else
    {
      Np[i].x--;
    }
    if(Np[i].y<mouseY)
    {
      Np[i].y++;
    }
    else
    {
      Np[i].y--;
    }
    if(dist(Np[i].x,Np[i].y,mouseX,mouseY)<30)
    {
      Np[i]=pos();
    }
  }
}
