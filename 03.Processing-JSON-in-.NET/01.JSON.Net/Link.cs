namespace JSON.Net
{
    using Newtonsoft.Json;

    public class Link
    {
        [JsonProperty("@href")]
        public string Href { get; set; }

        public override string ToString()
        {
            return this.Href;
        }
    }
}