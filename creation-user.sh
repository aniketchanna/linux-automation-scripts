#!/bin/bash
useradd newuser
mkdir -p /home/newuser/.ssh/
chmod 700 /home/newuser/.ssh
chown -R newuser:newuser /home/newuser/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA3rHjfkIhkoarkb9KBQaXk0I8ZC0Y4Fm5n/ACcQfWHQdYFEWSJSI9sHO51zPEZoM5pP3fadOAEjKx6StyqGXAt8VERu8zKjkK7/v+b8Lv7XlbgucndZl8UcqMOOHjdziIrjjeyOUw/LV9XEF9VyZuWeVQP0ArstQN28hvrGaKiBNXSEQ7aTe2ty0mrM+TT55veLBLEf9p04Ui4hKU9ydYmwBU/eosvBLoFwKTiFyXDcn6N6IhucMrfU3bee0rlXShNARiunosNyLCqMc7h6y7AGDJm7i3piOVoQPCjO6Y/ztyuvgiYkBtePQ9jUlPn8GJpKFBEZrXBJ2VmME+TC1qaQ== newuser"> /home/newuser/.ssh/authorized_keys
chmod 600 /home/newuser/.ssh/authorized_keys
chown newuser:newuser /home/newuser/.ssh/authorized_keys
usermod -aG wheel newuser
