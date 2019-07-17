/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.apache.rocketmq.example.simple;

import java.util.Arrays;
import java.util.List;
import org.apache.rocketmq.client.consumer.DefaultLiteMQPullConsumer;
import org.apache.rocketmq.common.message.MessageExt;
import org.apache.rocketmq.common.message.MessageQueue;

public class LitePullConsumerTest {
    public static void main(String[] args) throws Exception {
        DefaultLiteMQPullConsumer litePullConsumer = new DefaultLiteMQPullConsumer("test", null);
        litePullConsumer.subscribe("test", null);
        litePullConsumer.start();
        MessageQueue messageQueue = new MessageQueue("test", "duhengdeMacBook-Pro.local", 1);
        int i = 0;
        while (true) {
            List<MessageExt> messageExts = litePullConsumer.poll();
            System.out.println("-----------");
            System.out.println(messageExts);
            System.out.println("-----------");
            i++;
            if (i == 3) {
                System.out.println("pause");
                litePullConsumer.pause(Arrays.asList(messageQueue));
            }
            if (i == 10) {
                System.out.println("resume");
                litePullConsumer.resume(Arrays.asList(messageQueue));
            }
            litePullConsumer.commitSync();
        }
    }
}
