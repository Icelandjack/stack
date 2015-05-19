-- | Internal types to the library.

module Stack.Types.Internal where

import Control.Monad.Logger (LogLevel)
import Network.HTTP.Client.Conduit (Manager,HasHttpManager(..))
import Stack.Types.Config

-- | Monadic environment.
data Env =
  Env {envConfig :: !Config
      ,envLogLevel :: !LogLevel
      ,envManager :: !Manager}

instance HasStackRoot Env
instance HasUrls Env
instance HasConfig Env where
  getConfig = envConfig

instance HasHttpManager Env where
  getHttpManager = envManager

class HasLogLevel r where
  getLogLevel :: r -> LogLevel

instance HasLogLevel Env where
  getLogLevel = envLogLevel

instance HasLogLevel LogLevel where
  getLogLevel = id