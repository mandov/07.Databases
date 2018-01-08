using System;
using System.Collections;
using System.Xml;

class ExtractArtistsWithXPath
{
    static void Main()
    {
        XmlDocument doc = new XmlDocument();
        doc.Load("../../../Catalogue.xml");

        XmlNodeList artist = doc.SelectNodes("//artist");
        Hashtable artistsAndNumberOfAlumbs = new Hashtable();
        foreach (XmlNode item in artist)
        {
            if (!artistsAndNumberOfAlumbs.Contains(item.InnerText))
            {
                artistsAndNumberOfAlumbs.Add(item.InnerText, 1);
            }
            else
            {
                int oldValue = (int)artistsAndNumberOfAlumbs[item.InnerText];
                artistsAndNumberOfAlumbs[item.InnerText] = oldValue + 1;
            }
        }

        foreach (DictionaryEntry entry in artistsAndNumberOfAlumbs)
        {
            Console.WriteLine("Artist:{0}, Number of albums:{1}", entry.Key, entry.Value);
        }
    }
}