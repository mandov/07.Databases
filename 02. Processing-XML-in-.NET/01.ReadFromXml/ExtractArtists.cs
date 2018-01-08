namespace ExtractArtists
{
    using System;
    using System.Xml;
    using System.Collections;

    class ExtractArtists
    {
        static void Main()
        {
            XmlDocument doc = new XmlDocument();
            doc.Load("../../../Catalogue.xml");
            XmlNode root = doc.DocumentElement;
            Hashtable hashtable = new Hashtable();
            foreach (XmlNode node in root.ChildNodes)
            {
                if (!hashtable.Contains(node["artist"].InnerText))
                {
                    hashtable.Add(node["artist"].InnerText, 1);
                }
                else
                {
                    int oldValue = (int)hashtable[node["artist"].InnerText];
                    hashtable[node["artist"].InnerText] = oldValue + 1;
                }
            }

            foreach (DictionaryEntry entry in hashtable)
            {
                Console.WriteLine("Artist:{0}, Number of albums:{1}", entry.Key, entry.Value);
            }


        }
    }
}