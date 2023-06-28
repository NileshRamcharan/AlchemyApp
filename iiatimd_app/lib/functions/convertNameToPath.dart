String convertNameToPath(String name)
{
  String filepath = "images/";
  List<String> seperatedName = name.split(" ");
  for (int i = 0; i < seperatedName.length; i++)
  {
    filepath = filepath + "${seperatedName[i][0].toUpperCase()}${seperatedName[i].substring(1)}";
    if(i <(seperatedName.length - 1))
    {
      filepath = filepath + "_";
    }
    else
    {
      filepath = filepath + ".png";
    }
  }
  return filepath;
}