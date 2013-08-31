## Configuration 

After copying example.com and staging.example.com files to /etc/nginx/sites-enabled you need to create the symbolic links

```
sudo ln -s /etc/nginx/sites-enabled/example.com /etc/nginx/sites-available/example.com
```
and
```
sudo ln -s /etc/nginx/sites-enabled/staging.example.com /etc/nginx/sites-available/staging.example.com
```

Fore more information follow this [blogpost](http://blog.donaldderek.com/?p=165)
