Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFC8531541
	for <lists+squashfs-devel@lfdr.de>; Mon, 23 May 2022 19:30:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1ntBsr-0000zO-05; Mon, 23 May 2022 17:30:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nt23M-0007cV-Bs
 for squashfs-devel@lists.sourceforge.net; Mon, 23 May 2022 07:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n/ak3fxbDlmFRvOmVIgctXK5enM9fzzhqOEs66o/WZM=; b=aiPRYnVYlEpA+jdfN1FMsyltai
 u1y/2FKJ00EN21X0etR+71VjxjId16026zJEb1xIlQ+LMhpSCT8knoYw7PX0eT0tRtqSz+YRPWY+2
 asXypMqTv+Tw3Boc33JBZKoIeiSLnFylWpDTWQnFYObifzFoZiIViBD814fI/6od76FI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n/ak3fxbDlmFRvOmVIgctXK5enM9fzzhqOEs66o/WZM=; b=S7y4hyFoA4Mbzi+5MrInpwztsa
 aPNkMbguhSg8W0jTjB4Fcw/ZZv7GayVZCrlXC/uVRkjIOuqHaC587tcJcUFs6GRc8Zwu6AiDL+QIF
 DO6AUWjEJR0L0MPZWl/cbR2kbN4bVlaQr1RLrTQ6ZRfsgfClks8+WIrTjFutLsg1pFS0=;
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nt239-0005dK-Iu
 for squashfs-devel@lists.sourceforge.net; Mon, 23 May 2022 07:00:22 +0000
Received: by mail-pf1-f170.google.com with SMTP id f21so509926pfa.3
 for <squashfs-devel@lists.sourceforge.net>;
 Mon, 23 May 2022 00:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n/ak3fxbDlmFRvOmVIgctXK5enM9fzzhqOEs66o/WZM=;
 b=BJYsjmLTVsLt/DTcxdKUZlCPRaGxYqNgQ3iPjE0uaCVFHbQ5IfcSm2bRKpCOy1sKyB
 P8SRFu76e4eKYu2KV3zIGjFcZQz/o/iMiGBWw6KU64KmqHFC1s2lZDKrqqSxtW6As6L0
 iXUZ6q4c8IEnzqZTeXStFgBDuLzkBwg/vZEYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n/ak3fxbDlmFRvOmVIgctXK5enM9fzzhqOEs66o/WZM=;
 b=ZM00m/+G7Vqsop01rwqzVq/eXADonVsl68r7bCtSF+51osBELG7+m6JKcK0RAu8FzU
 niyh648TZKu66A1D46ajYC8pM13NpHLy9vM1WYgkiO7jbw2GJ6/bhR/sG/TO8/NpBcVX
 Loy/lfKMAxYHRTmHIivXzHxm9XV5kGvXhnf3aVI3iFSsQ3PUXQ5RJeVWqU3GTNRautql
 T1AGBNPZjAH4aHwqnKY4X2CMfZ8da2WkRQ44gWTHSNHJEFmIfOYaG6OX45V4e3QQftxA
 ay96VZI/q+r4cOKhgQnBQkBkbpQtgoD7x0Sh7zgyI+45LcJlzJ7M1AwBFQpf6fzNb96T
 CnFQ==
X-Gm-Message-State: AOAM530NmFiNFDcp5DrT7Pwgs80i/6AiOIeqMtE5m725TKTya3dyw+7s
 VhDUa9H80TgtShS52mmibVHEGw==
X-Google-Smtp-Source: ABdhPJwEV3eRY3ezvap02NItAMRg3nkr6LiufW/9apHU0swp7gID6uukw67Oyat2knY8vtCPnx9gMw==
X-Received: by 2002:a05:6a00:a85:b0:506:b9e:7f43 with SMTP id
 b5-20020a056a000a8500b005060b9e7f43mr22302851pfl.5.1653289212266; 
 Mon, 23 May 2022 00:00:12 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:76d5:494d:1690:d003])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a629402000000b005180f4733a8sm3099527pfe.106.2022.05.23.00.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 00:00:11 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Phillip Lougher <phillip@squashfs.org.uk>,
 Matthew Wilcox <willy@infradead.org>,
 Xiongwei Song <Xiongwei.Song@windriver.com>
Date: Mon, 23 May 2022 14:59:13 +0800
Message-Id: <20220523065909.883444-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220523065909.883444-1-hsinyi@chromium.org>
References: <20220523065909.883444-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 [209.85.210.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.170 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nt239-0005dK-Iu
X-Mailman-Approved-At: Mon, 23 May 2022 17:30:18 +0000
Subject: [Squashfs-devel] [PATCH v3 3/3] squashfs: implement readahead
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
- decompressor error.
Otherwise pages will be marked as uptodate. The unhandled pages will be
updated by readpage later.

Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reported-by: Matthew Wilcox <willy@infradead.org>
Reported-by: Phillip Lougher <phillip@squashfs.org.uk>
Reported-by: Xiongwei Song <Xiongwei.Song@windriver.com>
---
v2->v3: Add checks on
- decompressed block size.
- fill zeros if the last page is not a full page.

v2: https://lore.kernel.org/lkml/20220517082650.2005840-4-hsinyi@chromium.org/
v1: https://lore.kernel.org/lkml/20220516105100.1412740-3-hsinyi@chromium.org/
---
 fs/squashfs/file.c | 91 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index a8e495d8eb86..c311fc685fe4 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -39,6 +39,7 @@
 #include "squashfs_fs_sb.h"
 #include "squashfs_fs_i.h"
 #include "squashfs.h"
+#include "page_actor.h"
 
 /*
  * Locate cache slot in range [offset, index] for specified inode.  If
@@ -495,7 +496,95 @@ static int squashfs_read_folio(struct file *file, struct folio *folio)
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
+	int bsize, res, i, index, bytes, expected;
+	int file_end = i_size_read(inode) >> msblk->block_log;
+	unsigned int max_pages = 1UL << shift;
+	void *pageaddr;
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
+		expected = index == file_end ?
+			   (i_size_read(inode) & (msblk->block_size - 1)) :
+			    msblk->block_size;
+
+		bsize = read_blocklist(inode, index, &block);
+		if (bsize == 0)
+			goto skip_pages;
+
+		res = squashfs_read_data(inode->i_sb, block, bsize, NULL,
+					 actor);
+
+		if (res == expected) {
+			/* Last page may have trailing bytes not filled */
+			bytes = res % PAGE_SIZE;
+			if (bytes) {
+				pageaddr = kmap_atomic(pages[nr_pages - 1]);
+				memset(pageaddr + bytes, 0, PAGE_SIZE - bytes);
+				kunmap_atomic(pageaddr);
+			}
+
+			for (i = 0; i < nr_pages; i++)
+				SetPageUptodate(pages[i]);
+		}
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
2.36.1.124.g0e6072fb45-goog



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
