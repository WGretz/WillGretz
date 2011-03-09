require "yaml"
http_path = "/"
sass_dir = "_sass"

config = YAML.load(File.read("_config.yml"))
if config["env"] == "dev"
  css_dir = "_site/stylesheets"
  output_style = :expanded
else
  css_dir = "stylesheets"
  output_style = :compressed
end