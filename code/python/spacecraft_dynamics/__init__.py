"""
Spacecraft Dynamics and Control Library
Author: Emanuel Quintana Silva
Institution: UPTC
"""

__version__ = "1.0.0"
__author__ = "Emanuel Quintana Silva"

from . import attitude
from . import orbit
from . import control

__all__ = ['attitude', 'orbit', 'control']
