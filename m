Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9682952E345
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZl-0007OJ-Pq; Fri, 20 May 2022 03:45:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nqsZd-00035t-1C
 for squashfs-devel@lists.sourceforge.net; Tue, 17 May 2022 08:28:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=795DpeL4AVvHI+lpL0joEtH4VZitVLN+aqxdeh6jjYU=; b=ICN1Z1+pjPFT9BN3XIXTnhCVdf
 ITo36f/MpjepY5agnUehizrG0jHlpI487N33VSrkzPvP1OdQEk1MLBFZ8WiuO84ToXNtf1d9d3pgu
 Rty3wNd86t3PfwsJkxVC726rC/dqYcmT56geAnkscDhPdKhA+m2IUdkXin6w9FlKkRaE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=795DpeL4AVvHI+lpL0joEtH4VZitVLN+aqxdeh6jjYU=; b=PhZQNNaQxM+YAEslXBYAyTCXWz
 ocRPNRLtXVuNmClCTeFIu0/EyImrsx918C6Z2O+YqtWoeEXTjEQGSSU7dDn6lSl5s5t+/+nbXGbNJ
 zkAz9NSZDVOzZ+xzVCs3hZiAXk+af1R4MqeusQt7mnjUTb+zoYt6aW9p6rbkQ8GyO7cE=;
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nqsZU-0030l2-G1
 for squashfs-devel@lists.sourceforge.net; Tue, 17 May 2022 08:28:49 +0000
Received: by mail-pj1-f51.google.com with SMTP id
 t11-20020a17090a6a0b00b001df6f318a8bso1732899pjj.4
 for <squashfs-devel@lists.sourceforge.net>;
 Tue, 17 May 2022 01:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=795DpeL4AVvHI+lpL0joEtH4VZitVLN+aqxdeh6jjYU=;
 b=ED/whdRh9rUIrpg2gVqOkUlPSLfH+d13dKN6o5qhscZGfYA1wIc36jAYuO2aCcUTME
 tywwpQRtrhoL7YMncd8uUcl8ldVWCDe8Tvq+4wKthS8GnM6L16HjHx69ofm21fozQ2c1
 0gPwozKxl0EWsQf4v0ye2mrWDjOsxXqCxTdjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=795DpeL4AVvHI+lpL0joEtH4VZitVLN+aqxdeh6jjYU=;
 b=PnuQrVq24WZeQZL+8f7+hNRFxtDzrdDa6IsuCwSU/9I3RqpuVg9urcCxiZ8jG4mGkM
 T7w5LXMX+kTXZf5mTbEQSjNJ5TkVs76bWA8rZzcMGwO0WfPBGdWIG93BwrhnFNVWx0Iy
 BTPATzbwkSBxTmpzaLoQxJEgwU3pu7vHVCF706uXJ7iVO378kxRdZnKggbPeFvnlcKC1
 wjL+8HmBBOcjyifjvYhYfE5OeOGUj1ynIk0P7K8N9O12zGsXVDafbZHS96p1Ae/v9mYS
 k73W6WCVnoF6xJrEp2gHtMSwKuAebpX3tkiSzaBAX0bvxpT+B/IKUasWIjyLmUJ21e/B
 TrPw==
X-Gm-Message-State: AOAM530py4OYvHW/cABbXMkVkQY2Ehzmm7IueNvuQ/9iBvQ2/FUqqdXJ
 JwGTvZEI9/K1iM4k/sJJuE2Kcg==
X-Google-Smtp-Source: ABdhPJw4ZGZtF+d/OR1j0hvEL/B0NPDWxF9N8bLKwYKVOTs7d4kGTcfAco2jqXBr0hSexPHPCcRxIw==
X-Received: by 2002:a17:90b:4a02:b0:1dc:4710:c1fe with SMTP id
 kk2-20020a17090b4a0200b001dc4710c1femr35223567pjb.208.1652776122745; 
 Tue, 17 May 2022 01:28:42 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:beb2:ec58:2159:9a33])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a628409000000b0050dc76281d3sm8615083pfd.173.2022.05.17.01.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 01:28:42 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Phillip Lougher <phillip@squashfs.org.uk>,
 Matthew Wilcox <willy@infradead.org>,
 Xiongwei Song <Xiongwei.Song@windriver.com>
Date: Tue, 17 May 2022 16:26:54 +0800
Message-Id: <20220517082650.2005840-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220517082650.2005840-1-hsinyi@chromium.org>
References: <20220517082650.2005840-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Implement readahead callback for squashfs. It will read
 datablocks
 which cover pages in readahead request. For a few cases it will not mark
 page as uptodate, including: - file end is 0. - zero filled [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.51 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.51 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqsZU-0030l2-G1
X-Mailman-Approved-At: Fri, 20 May 2022 03:45:11 +0000
Subject: [Squashfs-devel] [PATCH v2 3/3] squashfs: implement readahead
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
Cc: "squashfs-devel @ lists . sourceforge . net"
 <squashfs-devel@lists.sourceforge.net>, Zhang Yi <yi.zhang@huawei.com>,
 linux-kernel@vger.kernel.org, "linux-mm @ kvack . org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>, Hou Tao <houtao1@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

Implement readahead callback for squashfs. It will read datablocks
which cover pages in readahead request. For a few cases it will
not mark page as uptodate, including:
- file end is 0.
- zero filled blocks.
- current batch of pages isn't in the same datablock or not enough in a
  datablock.
Otherwise pages will be marked as uptodate. The unhandled pages will be
updated by readpage later.

Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reported-by: Matthew Wilcox <willy@infradead.org>
Reported-by: Phillip Lougher <phillip@squashfs.org.uk>
Reported-by: Xiongwei Song <sxwjean@gmail.com>
---
v1->v2: remove unused check on readahead_expand().
v1: https://lore.kernel.org/lkml/20220516105100.1412740-3-hsinyi@chromium.org/
---
 fs/squashfs/file.c | 77 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index a8e495d8eb86..e10a55c5b1eb 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -39,6 +39,7 @@
 #include "squashfs_fs_sb.h"
 #include "squashfs_fs_i.h"
 #include "squashfs.h"
+#include "page_actor.h"
 
 /*
  * Locate cache slot in range [offset, index] for specified inode.  If
@@ -495,7 +496,81 @@ static int squashfs_read_folio(struct file *file, struct folio *folio)
 	return 0;
 }
 
+static void squashfs_readahead(struct readahead_control *ractl)
+{
+	struct inode *inode = ractl->mapping->host;
+	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
+	size_t mask = (1UL << msblk->block_log) - 1;
+	size_t shift = msblk->block_log - PAGE_SHIFT;
+	loff_t start = readahead_pos(ractl) &~ mask;
+	size_t len = readahead_length(ractl) + readahead_pos(ractl) - start;
+	struct squashfs_page_actor *actor;
+	unsigned int nr_pages = 0;
+	struct page **pages;
+	u64 block = 0;
+	int bsize, res, i, index;
+	int file_end = i_size_read(inode) >> msblk->block_log;
+	unsigned int max_pages = 1UL << shift;
+
+	readahead_expand(ractl, start, (len | mask) + 1);
+
+	if (file_end == 0)
+		return;
+
+	pages = kmalloc_array(max_pages, sizeof(void *), GFP_KERNEL);
+	if (!pages)
+		return;
+
+	actor = squashfs_page_actor_init_special(pages, max_pages, 0);
+	if (!actor)
+		goto out;
+
+	for (;;) {
+		nr_pages = __readahead_batch(ractl, pages, max_pages);
+		if (!nr_pages)
+			break;
+
+		if (readahead_pos(ractl) >= i_size_read(inode) ||
+		    nr_pages < max_pages)
+			goto skip_pages;
+
+		index = pages[0]->index >> shift;
+		if ((pages[nr_pages - 1]->index >> shift) != index)
+			goto skip_pages;
+
+		bsize = read_blocklist(inode, index, &block);
+		if (bsize == 0)
+			goto skip_pages;
+
+		res = squashfs_read_data(inode->i_sb, block, bsize, NULL,
+					 actor);
+
+		if (res >= 0)
+			for (i = 0; i < nr_pages; i++)
+				SetPageUptodate(pages[i]);
+
+		for (i = 0; i < nr_pages; i++) {
+			unlock_page(pages[i]);
+			put_page(pages[i]);
+		}
+	}
+
+	kfree(actor);
+	kfree(pages);
+	return;
+
+skip_pages:
+	for (i = 0; i < nr_pages; i++) {
+		unlock_page(pages[i]);
+		put_page(pages[i]);
+	}
+
+	kfree(actor);
+out:
+	kfree(pages);
+}
 
 const struct address_space_operations squashfs_aops = {
-	.read_folio = squashfs_read_folio
+	.read_folio = squashfs_read_folio,
+	.readahead = squashfs_readahead
 };
-- 
2.36.0.550.gb090851708-goog



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
