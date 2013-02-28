/* Partical system
 Small is beautiful
 */
import tsps.*;
TSPS tspsReceiver;
//ArrayList<TSPSPerson[]> people;
TSPSPerson[] people;
boolean addPeople=true;

ArrayList<ParticleSystem> ps;

void setup() {
  size(1000, 500);
  background(0);

  //all you need to do to start TSPS
  tspsReceiver= new TSPS(this, 12000);

  // ParticleSystem(acceleration, radious);
  ps = new ArrayList<ParticleSystem>();
}

void draw() {
  //  background(0);
  people = tspsReceiver.getPeopleArray();

  if (people.length ==3 && addPeople) {
    println("add");
    for (int i=0; i<people.length; i++) {
      PVector screenVector = new PVector(width, height);
      PVector pLocation = people[i].centroid;
      pLocation.mult(screenVector);
      println(i+"Location:"+pLocation);
            ps.add(new ParticleSystem(new PVector(0, 0), random(2, 10), pLocation));

      addPeople = false;
    }
  }

  for (ParticleSystem thisps: ps) {
    thisps.applyForce();
    thisps.addParticle();
    thisps.run();
  }
}

void mousePressed() {
  ps.add(new ParticleSystem(new PVector(0, 0), random(2, 10), new PVector(mouseX, mouseY)));
}

