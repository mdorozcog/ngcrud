# NGCRUD Ruby Gem

## Description

NGCRUD is a Ruby gem designed to simplify Angular code generation in the command-line interface (CLI), similar to the functionality provided by Rails for Ruby on Rails applications. With NGCRUD, you can effortlessly scaffold Angular components based on your defined models, streamlining the development of Angular applications.

## Installation

To install NGCRUD, use RubyGems:

```sh
gem install ngcrud
```

## Use

Suppose you want to generate Angular code for a "Contacts" model with the following attributes:

- name (string)
- telephone (string)
- birth_date (date)
- active (boolean)

```sh
ngcrud Contacts name:string telephone:string birth_date:date active:boolean email_marketing:boolean
```

This will generate inside src/app/features/contacts the following files and code:

- contact.ts - Resource interface typescript
- contacts.service.ts - The service
- /contacts-create/contacts-create.component.html
- /contacts-create/contacts-create.component.ts
- /contacts-list/contacts-list.component.html
- /contacts-list/contacts-list.component.ts

## License

NGCRUD is released under the [MIT License](https://chat.openai.com/c/LICENSE).

## Contact

If you have any questions or feedback, feel free to contact me mdorozcog@gmail.com

Happy coding!
