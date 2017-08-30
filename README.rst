====================
Askbot on Kubernetes
====================

Running `Askbot <https://github.com/askbot>`_ on Kubernetes.

.. code-block:: bash

    $ docker build -t hjacobs/askbot .
    $ docker run -it -p 8080:8080 hjacobs/askbot
