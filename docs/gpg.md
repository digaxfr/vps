# gpg

## Usage

To setup a key:

```
gpg --gen-key
```

To encrypt a message/file:

```
gpg --encrypt --sign --armor -r <recipient email> <file>
gpg -esar dc@darrench.in MySecretFile
```

To decrypt:

```
gpg MySecretFile.asc
```

To export my secret key:

```
gpg --export-secret-keys -a <id> > file.asc
```

To import my secret key:

```
gpg --import <file>
```

## References

* https://www.digitalocean.com/community/tutorials/how-to-use-gpg-to-encrypt-and-sign-messages
* https://stackoverflow.com/questions/5587513/how-to-export-private-secret-asc-key-to-decrypt-gpg-files-in-windows
