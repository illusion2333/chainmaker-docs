cd /home/chainmaker/sphinx-doc
## make readthedoc
make clean
make html
#sed -i "s%max-width:800px;%max-width:1200px;%g" /home/chainmaker/sphinx-doc/build/html/_static/css/theme.css
#sed -i "s%}.rst-content pre.literal-block%;border-left: 4px solid var(--theme-color, #0074d9);color: #858585;margin: 2em 0;padding-left: 20px;}.rst-content pre.literal-block%g" /home/chainmaker/sphinx-doc/build/html/_static/css/theme.css

## update css
cat >> ./build/html/_static/css/theme.css << EOF

.rst-content blockquote{
  border-left: 4px solid var(--theme-color, #0074d9);
  color: #858585;margin: 2em 0;
  padding-left: 20px;
}
.wy-nav-content{
	max-width:1200px;
}

EOF


## cp to nginx dir
sudo mv /usr/local/nginx/chainmaker-docs /usr/local/nginx/chainmaker-docs-bak
sudo mkdir -p /usr/local/nginx/chainmaker-docs
sudo cp -rf build/* /usr/local/nginx/chainmaker-docs/
sudo cp -rf source/images /usr/local/nginx/chainmaker-docs/html/

