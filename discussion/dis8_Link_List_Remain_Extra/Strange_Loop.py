import Link

Link = Link.Link

def strange_loop():
    """Return a Link s for which s.rest.first.rest is s.

    >>> s = strange_loop()
    >>> s.rest.first.rest is s
    True
    """
    "*** YOUR CODE HERE ***"
    s = Link(6, Link(Link(1)))
    s.rest.first.rest = s
    return s
    