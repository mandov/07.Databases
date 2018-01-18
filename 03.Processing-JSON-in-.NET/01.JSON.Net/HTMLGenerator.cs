namespace JSON.Net
{
    using System;
    using System.Collections.Generic;
    using System.Text;

    public class HTMLGenerator
    {
        private StringBuilder html = new StringBuilder();

        public void CreateHTMlFromPoco(IEnumerable<IVideo> pocoClass)
        {
            html.AppendLine("<!DOCTYPE html>");
            html.AppendLine("<html>");
            html.AppendLine("<body>");
            foreach (IVideo item in pocoClass)
            {
                html.AppendFormat("<p>\"{0}\"</p>", item.Title);
                html.AppendFormat("<iframe src=\"{0}\"</iframe>", item.Link.Href);
            }

            html.AppendLine("</body>");
            html.AppendLine("</html>");
        }

        public override string ToString()
        {
            return html.ToString();
        }
    }
}