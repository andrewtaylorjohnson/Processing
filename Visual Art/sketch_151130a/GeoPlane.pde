class GeoPlane
{
  int rows;
  int columns;
  
  float[] x;
  float[] y;
  
  GeoPlane(int rows, int columns)
  {
    this.rows = rows;
    this.columns = columns;
    
    x = new float[rows];
    y = new float[columns];
  }
  
  void update()
  {
    beginShape();
    
    endShape(CLOSE);
  }
}