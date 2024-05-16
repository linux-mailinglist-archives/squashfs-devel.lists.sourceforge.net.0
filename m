Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9918C7D1B
	for <lists+squashfs-devel@lfdr.de>; Thu, 16 May 2024 21:21:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1s7gfU-00076y-Nc;
	Thu, 16 May 2024 19:21:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <andy@martins.place>) id 1s7gfS-00076m-MK
 for squashfs-devel@lists.sourceforge.net;
 Thu, 16 May 2024 19:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Subject:Cc:To:From:Date:Message-Id:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x/35J6+d+Rdz55BY/Jp2t1ZEGq66xpMuB/UViFvnH5Q=; b=PumN5acaK0bAxfa+j99f6P6yAq
 Sy7J84mxmvprHa8xDiQHxzGt8oTdLhhnZmu00ADwgckYvkaYk6dajgS+iTcHC5hgXNUit7bMh2Fli
 fq7ndwVZbDPH1fMGrYaRKIdyL5O61rTSUU0MLtuRqIFVjmWgdx+kod3410uXcNxcheME=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Subject:Cc:To:From:Date:Message-Id:MIME-Version:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=x/35J6+d+Rdz55BY/Jp2t1ZEGq66xpMuB/UViFvnH5Q=; b=j
 K4bZeMI7Yag5BFe0QX/FkCIT3MjmYDbuonU2LaTwcQd7B1Ku+dXlf8FUneZYeBxa6IyB+1CXEuyCq
 APRsApi+pmMeyk+C6oDjjGo85fBtHS51AG87yVBwJAOZso3dBFcyyG2EanJxXd1ZuhnH3JV187jZO
 ou8K0AU64vkuS3bA=;
Received: from wfout6-smtp.messagingengine.com ([64.147.123.149])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s7gfR-0003NZ-5x for squashfs-devel@lists.sourceforge.net;
 Thu, 16 May 2024 19:21:30 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.west.internal (Postfix) with ESMTP id A650E1C00077;
 Thu, 16 May 2024 15:06:50 -0400 (EDT)
Received: from imap42 ([10.202.2.92])
 by compute2.internal (MEProxy); Thu, 16 May 2024 15:06:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=martins.place;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm1; t=1715886410; x=1715972810; bh=x/35J6+d+Rdz55BY/Jp2t
 1ZEGq66xpMuB/UViFvnH5Q=; b=w4oVSdZQC/pfTLEPiWbSkRD6vKekb+Ba8Vk2T
 xmffUHR9CQGMwG8QBeq6ZkZpVb9NiSld0qkHDcxPcrKDJ+F6jZmz9PuQII5KEc4O
 e0JWKNe+nmnV5IYLq7uwFgrFwOkBzEIVdNNh+h4V00Z0AQbfNSZdu/qKDpXBtlSZ
 T/H6iMa8iyIgz0Xsph7jOLuqzZOkKRIoXdDMU8HLjhpjdINpsIWFYCwey9kRPMJO
 IMj9f2AG84hjgAky6qMQktuZNAiTYBeun3sW8cLBy1rfqdskmc7UUbfNxe0ZTjgA
 pwqLLqPhUMpgp0OWxH8IoTdPcS1u4WzqhcyYF74mJi1k5cGGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1715886410; x=1715972810; bh=x/35J6+d+Rdz55BY/Jp2t1ZEGq66xpMuB/U
 ViFvnH5Q=; b=N3uuy/2YFJWsivkbhlTX2nt4zL/Uo8ofmFmWaBosNLFbNt4qK1y
 GlxGZRAaV/sc1CSAzXOzxccjrdSV3KAGBxXw69/LJW/63xbGI9mwYzYikF0f41sh
 K8fFCaPSFw4yaIguM+hKg7ykuji0t/QyO7oKmkBDNqrVKML8Tl8OKgoIgKDMVNyx
 D3yG+pXw5To9e6tI7aoil8MMKQPm3rapMgKpF/1Rd+NkrRyGShjCL8Dt1e4K3aVs
 bb6HMulebyPhUemXzs8twbSJEtc4FBKvPSWmaOcE9hMDmY2plnGGN+jNdpysJOwz
 t2ymEoJZGWEpazdmy3tm1Yt/BxynYQXy3cw==
X-ME-Sender: <xms:SllGZi4jS3u7wraLKRIh4wsLNoUtYn6A7fAg_sDRcpateoFiNCYY2g>
 <xme:SllGZr5q95przT3ACU0bjl0SFeEzMmbmoM6Jr4FiFugXsGNBnevVtUqWIX4-YR7JH
 Wz-dGb4-l-fSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehuddgudefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvfevufgtsehttd
 ertderredtnecuhfhrohhmpedfvedrucetnhguhicuofgrrhhtihhnfdcuoegrnhguhies
 mhgrrhhtihhnshdrphhlrggtvgeqnecuggftrfgrthhtvghrnhepudfhffdtfeevjeekff
 dtfeegjeffkeejfeejhfehtdetuefhveeiuddtieekheeinecuffhomhgrihhnpehiuhdr
 vgguuhdptghhrhhishguohifnhdrnhgrmhgvnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomheprghnugihsehmrghrthhinhhsrdhplhgrtggv
X-ME-Proxy: <xmx:SllGZhd_x2eL7GXOovNDl3v-poEBIyzAFqxXFBwHcp7Gt9rIEwennw>
 <xmx:SllGZvIyN8yP-X9TqQ_Gc5eB74EP-8vj1qiDGuT6svmO_q1QjuDmTA>
 <xmx:SllGZmLhoZoDahDHNtE9BKq1CJJLM8fNo8tKXZvhaG03CWWp9RQNGQ>
 <xmx:SllGZgyfqYpwl3HeGZ1b7Q3KY4Myw_11td-t8NFgyZOVqOBIKlW2Cw>
 <xmx:SllGZojqEmJj68R6JA_ktmC1dV8vuJSFF3htfPC04VfIe65ne4Nqbaw->
Feedback-ID: i8e414708:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 08760BC0081; Thu, 16 May 2024 15:06:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-456-gcd147058c-fm-hotfix-20240509.001-g0aad06e4
MIME-Version: 1.0
Message-Id: <0acec0e2-dc6c-42f6-ad47-6b16e0bc95a9@app.fastmail.com>
Date: Thu, 16 May 2024 15:06:01 -0400
From: "C. Andy Martin" <andy@martins.place>
To: squashfs-devel@lists.sourceforge.net
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The metadata cache size was hard-coded to 8 metadata blocks.
 A large parallel workload can cause a lot of spinlock thrashing in
 squashfs_cache_get
 if the number of metadata blocks is smaller than the [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: iu.edu]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [64.147.123.149 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1s7gfR-0003NZ-5x
Subject: [Squashfs-devel] [PATCH] squashfs: add config for metadata cache
 size
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

The metadata cache size was hard-coded to 8 metadata blocks.  A large
parallel workload can cause a lot of spinlock thrashing in
squashfs_cache_get if the number of metadata blocks is smaller than
the number of parallel metadata reads, as the decompression time can
keep the metadata cache full, and squashfs_cache_get uses a simple
spinlock to synchronize the cache.  Allow the cache size to be tuned
by adding CONFIG_SQUASHFS_METADATA_CACHE_SIZE which defaults to the
old hard-coded value of 8.  A good setting for systems with plenty of
memory would be something a big larger than the expected number of
parallel readers on a single squashfs.  For highly memory constrained
systems, a smaller setting may be appropriate.

This issue was discovered on an embedded where a large performance drop
in boot times was noticed when the system from an 8 core (4 physical)
machine to a 16 core (8 physical) machine. It was discovered that much
CPU time was being spun away in the spin_lock call in
squashfs_cache_get. This was due to the fact that the metadata cache is
fixed at 8 entries, and having more cores allowed more parallel file
system walks (which happens to be a part of one of our service start
scripts for each of our many parallel services). Because when each cache
entry is released all waiting cores are awakened to attempt to grab
another cache entry, those cores fight over the spinlock just to find
out they are not going to get another cache entry.

While this commit isn't a general solution, it does provide a simple way
for one to configure their kernel to alleviate the performance issue.

A better solution would be to use a less CPU intensive and preemptable
synchronization method, and to only wake up one waiter when one cache
entry comes up.

Others have pointed out this issue:

http://lkml.iu.edu/hypermail/linux/kernel/1805.0/01702.html

And this is a similar issue, but on the data cache, but points out many
of the same technical issues with squashfs_cache_get:

https://chrisdown.name/2018/04/17/kernel-adventures-the-curious-case-of-squashfs-stalls.html

A simple way to reproduce and measure the time for various parallel
workloads (assuming a fairly large number of directories and files in
the squashfs):

time ( N=16; for ((i=0;i<$N;++i)); \
do find /path/to/mounted/squash/ -print > /dev/null & done; \
for ((i=0;i<$N;++i)); do wait; done)

On one system, with N=8, the loop above takes 1 second of elapsed time,
but on the same system with N=16, it takes 13 seconds (when 2 would be a
reasonable scale up).
---
 fs/squashfs/Kconfig       | 20 ++++++++++++++++++++
 fs/squashfs/squashfs_fs.h |  2 +-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/fs/squashfs/Kconfig b/fs/squashfs/Kconfig
index 60fc98bdf4212..311e3141df9af 100644
--- a/fs/squashfs/Kconfig
+++ b/fs/squashfs/Kconfig
@@ -264,3 +264,23 @@ config SQUASHFS_FRAGMENT_CACHE_SIZE
 
 	  Note there must be at least one cached fragment.  Anything
 	  much more than three will probably not make much difference.
+
+config SQUASHFS_METADATA_CACHE_SIZE
+	int "Number of metadata blocks cached" if SQUASHFS_EMBEDDED
+	depends on SQUASHFS
+	default "8"
+	help
+	  By default SquashFS caches the last 8 metadata blocks read from the
+	  filesystem.  A metadata block is 8KiB.  Increasing this amount may
+	  mean SquashFS has to re-read metadata less often from disk, at the
+	  expense of extra system memory.  Decreasing this amount will mean
+	  SquashFS uses less memory at the expense of extra reads from disk.
+
+	  Note there must be at least one cached metadata block.  A setting too
+	  low with a large parallel workload can cause a lot of spinlock
+	  thrashing in squashfs_cache_get.  A good setting for the metadata
+	  cache size is something a bit larger than the number of expected
+	  parallel metadata reads.  When booting with multiple services on a
+	  single squashfs on a machine with a lot of cores, a higher setting
+	  than the default will net a large performance improvement by avoiding
+	  spinlock thrashing.
diff --git a/fs/squashfs/squashfs_fs.h b/fs/squashfs/squashfs_fs.h
index 95f8e89017689..c4e32358f922c 100644
--- a/fs/squashfs/squashfs_fs.h
+++ b/fs/squashfs/squashfs_fs.h
@@ -202,7 +202,7 @@ static inline int squashfs_block_size(__le32 raw)
 #define SQUASHFS_XATTR_OFFSET(A)	((unsigned int) ((A) & 0xffff))
 
 /* cached data constants for filesystem */
-#define SQUASHFS_CACHED_BLKS		8
+#define SQUASHFS_CACHED_BLKS		CONFIG_SQUASHFS_METADATA_CACHE_SIZE
 
 /* meta index cache */
 #define SQUASHFS_META_INDEXES	(SQUASHFS_METADATA_SIZE / sizeof(unsigned int))
-- 
2.34.1


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
