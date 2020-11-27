clusters = europe, china

europe.bootstrap.servers = ${SOURCE}
china.bootstrap.servers = ${DESTINATION}

europe->china.enabled = true
europe->china.topics = ${TOPICS}

# Prevent topics from getting prefixed
# This is fine as long as we have only one way replication
replication.policy.separator: 
source.cluster.alias: 
target.cluster.alias: 

checkpoints.topic.replication.factor=3
heartbeats.topic.replication.factor=3
offset-syncs.topic.replication.factor=3

offset.storage.replication.factor=3
status.storage.replication.factor=3
config.storage.replication.factor=3

sync.topic.acls.enabled = true
tasks.max = ${TASKS_MAX}
replication.factor = 3
refresh.topics.enabled = true
sync.topic.configs.enabled = true
refresh.topic.interval.seconds = ${REFRESH_TOPIC_INTERVAL_SECONDS}
