Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA87252E33A
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZj-0007IH-Cn; Fri, 20 May 2022 03:45:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nqYKK-0007R6-Bw
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 10:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JMk8CHB5bcq3ReSzg2cgECR0dlKU/tAyeAvoi2QnfNE=; b=h6U9F+Db+ocaH66Q9t65/EkAeD
 f8W9uTsqxA3pf4hWYTvEwpITcSGLoTkk0AK+R28uSV2iaXo/N/qteJsXfh68D+GD+kmtvx8BWMqhW
 06eQu+utZ8xoRla37uoTI1Ax+dOn7GDoqTws0dFr251LlgquFqVDpRHmGtfUjBkQ8SLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JMk8CHB5bcq3ReSzg2cgECR0dlKU/tAyeAvoi2QnfNE=; b=eHdw23+OEbCnmn2BXDMWO2yKXh
 VEqMp2xqYjchlKbE6ln07BZnnj14GNDviR+5mSLQfoVasOl3L6BZs07aTd0kFfOGLRKSAGOkxlv/Q
 jmU57xnjUnx+ribM7ufnOkYOJ7n0MFVd8hXR23TAgoviaj95PnS/eOgoPNF60jcgoPSU=;
Received: from mail-pg1-f172.google.com ([209.85.215.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nqYKH-00Gwvu-Tl
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 10:51:46 +0000
Received: by mail-pg1-f172.google.com with SMTP id q76so13706854pgq.10
 for <squashfs-devel@lists.sourceforge.net>;
 Mon, 16 May 2022 03:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JMk8CHB5bcq3ReSzg2cgECR0dlKU/tAyeAvoi2QnfNE=;
 b=OKNynNPjFwGSD1DaPCEF49HEOaVfWkiddIt3TLXpzovZPm0w32mw1+sI5jGIZ53iqU
 DL9zHg/3+jPPwXL2vHoPtL1DSdVsyH7bZNV/hZuu9cmfO6L1xO1Gfss1yn77yPBo7s1z
 +wJTDMciFy2TsqHd/skAMTirRIHnkR7xPShJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JMk8CHB5bcq3ReSzg2cgECR0dlKU/tAyeAvoi2QnfNE=;
 b=D8Tv7kgvbahzUPgeYLH4mQsVvqah+vl01f1TgArRSoevfp/PfxEzjHg7wVdb3StXjt
 YQoD5mHooewVpM+1/7GUJMptaJWn1mTNzAHQh5FWKKXPputx7crx62Qj+sJkbgR1EooX
 v+piz8Z2tK+sXcUPlVu1waROq1W2T+QiIsCqZTguP8mIjsNudk+bAnkEydlARNx86lhb
 4gCXmMSLPAkSeIFL8Kmf2d5J4QG9/JorKSo5fFXmyNxsQ4It93NX+6g2Fm7pyZC3y44R
 5SAFUQfzjcqnyidyMe41nBU91bN1332TnfWp7BlPNfPvqcpgJgwQW4RjirMSpr5v3rPZ
 pi6A==
X-Gm-Message-State: AOAM532JXjOk+hCiKi5DK3DCtMEZAj/NQiDu1mOJ6xCLWfHWQs+z9mQ4
 0LafDFhcuQTzooZgfKOl/DOHbA==
X-Google-Smtp-Source: ABdhPJxLUCazJwseAQ0wLAS5elWc0Q0J8Q3r6TfTavcCh6mUPnQw7yZb7qUH+IJgOAbR/PLOnZFxKw==
X-Received: by 2002:a05:6a00:10cc:b0:506:e0:d6c3 with SMTP id
 d12-20020a056a0010cc00b0050600e0d6c3mr17147886pfu.33.1652698300335; 
 Mon, 16 May 2022 03:51:40 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:cdcb:c865:6f65:d875])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a655bce000000b003db8dd388afsm6332778pgr.10.2022.05.16.03.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:51:40 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Phillip Lougher <phillip@squashfs.org.uk>,
 Matthew Wilcox <willy@infradead.org>,
 Xiongwei Song <Xiongwei.Song@windriver.com>
Date: Mon, 16 May 2022 18:51:03 +0800
Message-Id: <20220516105100.1412740-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220516105100.1412740-1-hsinyi@chromium.org>
References: <20220516105100.1412740-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
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
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.172 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqYKH-00Gwvu-Tl
X-Mailman-Approved-At: Fri, 20 May 2022 03:45:10 +0000
Subject: [Squashfs-devel] [PATCH 2/2] squashfs: implement readahead
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

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
Note that this patch was not formally sent to the list before. It's
attached to email thread for discussion as it's still under development.

- v1:
The patch outline was suggested by Matthew. It went through a few
reviews by Matthew offline.

- v2:
https://lore.kernel.org/linux-mm/Yn5Yij9pRPCzDozt@casper.infradead.org/t/#m442435c149d411c5c9d8019cff5915419b04bf10
This is a resend of v1.

- v3:
https://lore.kernel.org/linux-mm/Yn5Yij9pRPCzDozt@casper.infradead.org/t/#m55a709e6ba5ec59fe95323a67a7f3d6b1953e470
Fix page actor size to avoid a crash from squashfs_decompress().
Suggested by Phillip Lougher[1]
[1] https://lore.kernel.org/linux-mm/Yn5Yij9pRPCzDozt@casper.infradead.org/t/#m687f82debb7667ff31982a05aef3eba081eb5039

- v4:
https://lore.kernel.org/linux-mm/Yn5Yij9pRPCzDozt@casper.infradead.org/t/#mf93267690ec2e841dade6a494fe72c84b61328d9
Fix to free page after used. Suggested by Xiongwei Song[2]
Refactor the skip page logic to possible improve the performance.
Suggested by Phillip Lougher[3]
[2] https://lore.kernel.org/linux-mm/Yn5Yij9pRPCzDozt@casper.infradead.org/t/#m0e7b33d167b1ef0eb39b9f41c32ed3f80dfced18
[3] https://lore.kernel.org/linux-mm/Yn5Yij9pRPCzDozt@casper.infradead.org/t/#m1e0a8f8e4a98d79d14c81b66e197b6dc0a3b77a1
---
 fs/squashfs/file.c | 77 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index a8e495d8eb86..91dfec792f4c 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -39,6 +39,7 @@
 #include "squashfs_fs_sb.h"
 #include "squashfs_fs_i.h"
 #include "squashfs.h"
+#include "page_actor.h"
 
 /*
  * Locate cache slot in range [offset, index] for specified inode.  If
@@ -495,7 +496,83 @@ static int squashfs_read_folio(struct file *file, struct folio *folio)
 	return 0;
 }
 
+static void squashfs_readahead(struct readahead_control *ractl)
+{
+	struct inode *inode = ractl->mapping->host;
+	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
+	size_t mask = (1UL << msblk->block_log) - 1;
+	size_t shift = msblk->block_log - PAGE_SHIFT;
+	loff_t req_end = readahead_pos(ractl) + readahead_length(ractl);
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
+	if (readahead_pos(ractl) + readahead_length(ractl) < req_end ||
+	    file_end == 0)
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
 	.read_folio = squashfs_read_folio
+	.readahead = squashfs_readahead
 };
-- 
2.36.0.550.gb090851708-goog



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
